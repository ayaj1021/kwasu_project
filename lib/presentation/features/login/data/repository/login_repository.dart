import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/config/app_constants.dart';
import 'package:kwasu_app/config/base_response.dart';
import 'package:kwasu_app/exceptions/app_exception.dart';
import 'package:kwasu_app/presentation/features/login/data/model/login_request.dart';
import 'package:kwasu_app/presentation/features/login/data/model/login_response.dart';
import 'package:kwasu_app/services/api_service.dart';

class LoginRepository {
  LoginRepository(this._networkService);
  final ApiService _networkService;
  Future<BaseResponse<Data>> login(LoginRequest request) async {
    try {
      final res = await _networkService.postRequest(
        endpoint: AppConstants.login,
        requestBody: request.toJson(),
      );

      return BaseResponse<Data>(
        status: res.status,
        data: Data.fromJson(res.data),
        message: res.message,
      );
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepository>(
    (ref) => LoginRepository(ref.read(networkServiceProvier)));
