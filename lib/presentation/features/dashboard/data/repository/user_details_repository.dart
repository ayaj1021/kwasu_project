import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/config/app_constants.dart';
import 'package:kwasu_app/config/base_response.dart';
import 'package:kwasu_app/exceptions/app_exception.dart';
import 'package:kwasu_app/presentation/features/dashboard/data/model/user_details_response.dart';
import 'package:kwasu_app/services/api_service.dart';

class UserDetailsRepository {
  UserDetailsRepository(this._networkService);
  final ApiService _networkService;
  Future<BaseResponse<UserDetailsData>> getUserDetails(String id) async {
    try {
      final res = await _networkService.getRequest(
        endpoint: AppConstants.getUserDetails(id),
      );

      return BaseResponse<UserDetailsData>(
        status: res.status,
        data: UserDetailsData.fromJson(res.data),
        message: res.message,
      );
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getUserDetailsRepositoryProvider = Provider<UserDetailsRepository>(
    (ref) => UserDetailsRepository(ref.read(networkServiceProvier)));
