import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickAndSaveImage({
    required ImageSource source,
    int maxSizeInMB = 10,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1920, // Optional: compress large images
        maxHeight: 1080,
        imageQuality: 80, // Reduce image quality to manage file size
      );

      if (pickedFile == null) return null;

      // Get permanent directory
      final directory = await getApplicationDocumentsDirectory();

      // Generate a unique filename
      final String fileName =
          'IMG_${DateTime.now().millisecondsSinceEpoch}${path.extension(pickedFile.path)}';
      final String newPath = path.join(directory.path, fileName);

      // Copy file to permanent location
      final File permanentFile = await File(pickedFile.path).copy(newPath);

      // Validate file size
      final fileSize = await permanentFile.length();
      if (fileSize > maxSizeInMB * 1024 * 1024) {
        // Optional: Delete the file if it's too large
        await permanentFile.delete();
        throw Exception('File size exceeds $maxSizeInMB MB');
      }

      return permanentFile;
    } catch (e) {
      print('Image picker error: $e');
      return null;
    }
  }

  // Optional: Add a method to compress images if needed
  static Future<File?> compressImage(File file, {int quality = 80}) async {
    try {
      // Implement image compression logic
      // You might want to use a package like flutter_image_compress
      return file;
    } catch (e) {
      print('Image compression error: $e');
      return null;
    }
  }
}

class FilePickerHelper {
  // Function to pick a file and return its name
  static Future<Map<String, String>?> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // Get the file name and path
        String fileName = result.files.single.name;
        String? filePath = result.files.single.path;
        return {'name': fileName, 'path': filePath ?? ''};
      }
    } catch (e) {
      log("Error picking file: $e");
    }
    return null;
  }
}
