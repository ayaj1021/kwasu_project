import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/config/base_response.dart';
import 'package:kwasu_app/services/data_storage.dart';

class ApiService {
  late final Dio _dio;
  //ApiService(Dio instance) : _dio = instance;
  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://devbackend.bizconnect24.com",
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      if (kDebugMode)
        LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true,
        ),
      InterceptorsWrapper(
          // onRequest: _onRequest,
          // onError: _onError,
          ),
    ]);
  }

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
            status: false, message: 'Poor internet connection!', data: null);
      } else if (e is DioException) {
        return BaseResponse(
            status: false,
            message: e.message ?? 'An error occured',
            data: null);
      }
      return BaseResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<BaseResponse<T>> postRequest<T>(
      {String? endpoint,
      Map<String, dynamic>? query,
      //  bool isProtected = true,
      Object? requestBody}) async {
    try {
      final response = await _dio.post(
        endpoint ?? '',
        queryParameters: query,
        data: requestBody,
        options: Options(
          sendTimeout: const Duration(minutes: 2),
          validateStatus: (status) => status! < 500,
        ),
      );
      //  Options(headers: isProtected ? await _fetchHeaders() : null));
      return BaseResponse.fromMap(response.data);
    } on DioException catch (e) {
      _handleError(e);
      // if (e is SocketException) {
      //   return BaseResponse(
      //     status: false,
      //     message: 'Poor internet connection!',
      //   );
      // } else if (e is DioException) {
      //   return BaseResponse(
      //     status: false,
      //     message: e.message ?? 'An error occured',
      //     //  data: null
      //   );
      // }
      return BaseResponse(
        status: false, message: e.toString(),

        //data: null
      );
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
            status: false, message: 'Poor internet connection!', data: null);
      } else if (e is DioException) {
        return BaseResponse(
            status: false,
            message: e.message ?? 'An error occured',
            data: null);
      }
      return BaseResponse(status: false, message: e.toString(), data: null);
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
            status: false, message: 'Poor internet connection!', data: null);
      } else if (e is DioException) {
        return BaseResponse(
            status: false,
            message: e.message ?? 'An error occured',
            data: null);
      }
      return BaseResponse(status: false, message: e.toString(), data: null);
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
            status: false, message: 'Poor internet connection!', data: null);
      } else if (e is DioException) {
        return BaseResponse(
            status: false,
            message: e.message ?? 'An error occured',
            data: null);
      }
      return BaseResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<Map<String, String>> _fetchHeaders() async {
    final token = await SecureStorageService().readAccessToken() ?? '';
    return {'Authorization': 'Bearer $token'};
  }

  void _handleError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      throw Exception('Connection timed out');
    }

    final response = error.response;
    if (response != null) {
      switch (response.statusCode) {
        case 401:
          throw Exception('Session expired. Please login again.');
        case 403:
          throw Exception('You do not have permission to access this resource');
        case 404:
          throw Exception('The requested resource was not found');
        case 500:
          throw Exception('Internal server error occurred');
        default:
          throw Exception(
              response.data?['message'] ?? 'An unexpected error occurred');
      }
    }

    throw Exception('Network error occurred');
  }
}

final networkServiceProvier = Provider((_) => ApiService());
