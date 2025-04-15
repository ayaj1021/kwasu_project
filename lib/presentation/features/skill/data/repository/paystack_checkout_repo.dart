import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/config/app_constants.dart';
import 'package:kwasu_app/config/base_response.dart';
import 'package:kwasu_app/exceptions/app_exception.dart';
import 'package:kwasu_app/presentation/features/skill/data/model/paystack_checkout_response.dart';
import 'package:kwasu_app/services/api_service.dart';

class PaystackCheckoutRepository {
  PaystackCheckoutRepository(this._networkService);
  final ApiService _networkService;
  Future<BaseResponse<PaystackCheckoutData>> paystackCheckout() async {
    try {
      final res = await _networkService.postRequest(
        endpoint: AppConstants.paystackCheckout,
      );

      return BaseResponse(
          status: res.status,
          message: res.message,
          data: PaystackCheckoutData.fromJson(res.data));
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final paystackCheckoutRepositoryProvider = Provider<PaystackCheckoutRepository>(
    (ref) => PaystackCheckoutRepository(ref.read(networkServiceProvier)));
