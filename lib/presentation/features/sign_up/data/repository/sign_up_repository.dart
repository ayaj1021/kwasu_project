import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/config/app_constants.dart';
import 'package:kwasu_app/config/base_response.dart';
import 'package:kwasu_app/exceptions/app_exception.dart';
import 'package:kwasu_app/presentation/features/login/data/model/login_response.dart';
import 'package:kwasu_app/presentation/features/sign_up/data/model/signup_request.dart';
import 'package:kwasu_app/services/api_service.dart';

class SignUpRepository {
  SignUpRepository(this._networkService);
  final ApiService _networkService;
  Future<BaseResponse<Data>> signUp(SignupRequest request) async {
    try {
      final res = await _networkService.postRequest(
        endpoint: AppConstants.register,
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

final loginRepositoryProvider = Provider<SignUpRepository>(
    (ref) => SignUpRepository(ref.read(networkServiceProvier)));
