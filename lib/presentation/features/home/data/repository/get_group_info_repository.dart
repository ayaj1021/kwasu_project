import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/config/app_constants.dart';
import 'package:kwasu_app/config/base_response.dart';
import 'package:kwasu_app/exceptions/app_exception.dart';
import 'package:kwasu_app/presentation/features/home/data/model/get_group_info_response.dart';
import 'package:kwasu_app/services/api_service.dart';

class GetGroupInfoRepository {
  GetGroupInfoRepository(this._networkService);
  final ApiService _networkService;
  Future<BaseResponse<List<GetGroupInfoData>>> getGroupInfo(String id) async {
    try {
      final res = await _networkService.getRequest(
        endpoint: AppConstants.getGroupInfo(id),
      );

      if (res.data is Map<String, dynamic>) {
        final List<dynamic> dataList =
            (res.data as Map<String, dynamic>)['data'] ?? [];

        return BaseResponse(
          status: res.status,
          message: res.message,
          data:
              dataList.map((item) => GetGroupInfoData.fromJson(item)).toList(),
        );
      } else if (res.data is List<dynamic>) {
        return BaseResponse(
          status: res.status,
          message: res.message,
          data: (res.data as List<dynamic>)
              .map((item) => GetGroupInfoData.fromJson(item))
              .toList(),
        );
      } else {
        // Handle unexpected data format
        throw Exception("Unexpected response format");
      }
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getGroupInfoRepositoryProvider = Provider<GetGroupInfoRepository>(
    (ref) => GetGroupInfoRepository(ref.read(networkServiceProvier)));
