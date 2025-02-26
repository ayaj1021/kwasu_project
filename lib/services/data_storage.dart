import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final String _accesskey = 'access_token';
  final String _refreshkey = 'refresh_token';
  final String _userId = 'user_id';

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

  Future<String?> readRefreshToken() async {
    try {
      return await _flutterSecureStorage.read(key: _refreshkey);
    } catch (e, s) {
      debugPrint('error trying to read access token $e, $s');
      return null;
    }
  }

  Future<void> writeRefreshToken({String? token}) async {
    try {
      await _flutterSecureStorage.write(key: _refreshkey, value: token);
    } catch (e, s) {
      debugPrint('error trying to write access token $e $s');
    }
  }

  Future<String?> readUserId() async {
    try {
      return await _flutterSecureStorage.read(key: _userId);
    } catch (e, s) {
      debugPrint('error trying to read access token $e, $s');
      return null;
    }
  }

  Future<void> writeUserId({String? token}) async {
    try {
      await _flutterSecureStorage.write(key: _userId, value: token);
    } catch (e, s) {
      debugPrint('error trying to write access token $e $s');
    }
  }
}
