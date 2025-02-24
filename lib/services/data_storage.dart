import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final String _accesskey = 'access_token';

  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  Future<void> deleteAccessToken() async {
    try {
      await _flutterSecureStorage.delete(key: _accesskey);
      debugPrint("deleted access token");
    } catch (e, s) {
      debugPrint('error trying to delete access token $e, $s');
    }
  }

  Future<String?> readAccessToken() async {
    try {
      return await _flutterSecureStorage.read(key: _accesskey);
    } catch (e, s) {
      debugPrint('error trying to read access token $e, $s');
      return null;
    }
  }

  Future<void> writeAccessToken({String? token}) async {
    try {
      await _flutterSecureStorage.write(key: _accesskey, value: token);
    } catch (e, s) {
      debugPrint('error trying to write access token $e $s');
    }
  }
}
