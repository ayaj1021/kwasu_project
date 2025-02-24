import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/config/base_response.dart';
import 'package:kwasu_app/services/data_storage.dart';

class ApiService {
  late final Dio _dio;
  //ApiService(Dio instance) : _dio = instance;

  Future<BaseResponse> getRequest(
      {String? endpoint,
      Map<String, dynamic>? query,
      bool isProtected = true}) async {
    try {
      final response = await _dio.get(endpoint ?? '',
          queryParameters: query,
          options:
              Options(headers: isProtected ? await _fetchHeaders() : null));
      return BaseResponse.fromMap(response.data);
    } catch (e) {
      if (e is SocketException) {
        return BaseResponse(
            success: false, message: 'Poor internet connection!', data: null);
      } else if (e is DioException) {
        return BaseResponse(
            success: false,
            message: e.message ?? 'An error occured',
            data: null);
      }
      return BaseResponse(success: false, message: e.toString(), data: null);
    }
  }

  Future<BaseResponse> postRequest(
      {String? endpoint,
      Map<String, dynamic>? query,
      bool isProtected = true,
      Object? requestBody}) async {
    try {
      final response = await _dio.post(endpoint ?? '',
          queryParameters: query,
          data: requestBody,
          options:
              Options(headers: isProtected ? await _fetchHeaders() : null));
      return BaseResponse.fromMap(response.data);
    } catch (e) {
      if (e is SocketException) {
        return BaseResponse(
            success: false, message: 'Poor internet connection!', data: null);
      } else if (e is DioException) {
        return BaseResponse(
            success: false,
            message: e.message ?? 'An error occured',
            data: null);
      }
      return BaseResponse(success: false, message: e.toString(), data: null);
    }
  }

  Future<BaseResponse> putRequest(
      {String? endpoint,
      Map<String, dynamic>? query,
      bool isProtected = true,
      Object? requestBody}) async {
    try {
      final response = await _dio.put(endpoint ?? '',
          queryParameters: query,
          data: requestBody,
          options:
              Options(headers: isProtected ? await _fetchHeaders() : null));
      return BaseResponse.fromMap(response.data);
    } catch (e) {
      if (e is SocketException) {
        return BaseResponse(
            success: false, message: 'Poor internet connection!', data: null);
      } else if (e is DioException) {
        return BaseResponse(
            success: false,
            message: e.message ?? 'An error occured',
            data: null);
      }
      return BaseResponse(success: false, message: e.toString(), data: null);
    }
  }

  Future<BaseResponse> deleteRequest(
      {String? endpoint,
      Map<String, dynamic>? query,
      bool isProtected = true,
      Object? requestBody}) async {
    try {
      final response = await _dio.delete(endpoint ?? '',
          queryParameters: query,
          data: requestBody,
          options:
              Options(headers: isProtected ? await _fetchHeaders() : null));
      return BaseResponse.fromMap(response.data);
    } catch (e) {
      if (e is SocketException) {
        return BaseResponse(
            success: false, message: 'Poor internet connection!', data: null);
      } else if (e is DioException) {
        return BaseResponse(
            success: false,
            message: e.message ?? 'An error occured',
            data: null);
      }
      return BaseResponse(success: false, message: e.toString(), data: null);
    }
  }

  /// This method is called when making any requests with files e.g when
  /// uploading a profile image. The [fileName] is the name
  /// of the field in the request body and [fileBytes] is the byte data of the file being uploaded
  ///
  ///
  /// The [otherFieldsInRequest] represents other non-file fields that will be merged in the formdata
  /// alongside the files to be uploaded.
  Future<BaseResponse> requestWithFile(
      {String? endpoint,
      Map<String, dynamic>? query,
      String fileName = '',
      List<int> fileBytes = const [],
      bool isProtected = true,
      Object? otherFieldsInRequest}) async {
    try {
      final formData = FormData.fromMap({
        ...?(otherFieldsInRequest as Map?),
        fileName: MultipartFile.fromBytes(fileBytes)
      });
      final response = await _dio.post(endpoint ?? '',
          queryParameters: query,
          data: formData,
          options:
              Options(headers: isProtected ? await _fetchHeaders() : null));
      return BaseResponse.fromMap(response.data);
    } catch (e) {
      if (e is SocketException) {
        return BaseResponse(
            success: false, message: 'Poor internet connection!', data: null);
      } else if (e is DioException) {
        return BaseResponse(
            success: false,
            message: e.message ?? 'An error occured',
            data: null);
      }
      return BaseResponse(success: false, message: e.toString(), data: null);
    }
  }

  Future<Map<String, String>> _fetchHeaders() async {
    final token = await SecureStorageService().readAccessToken() ?? '';
    return {'Authorization': 'Bearer $token'};
  }
}

final networkServiceProvier = Provider((_) => ApiService());
