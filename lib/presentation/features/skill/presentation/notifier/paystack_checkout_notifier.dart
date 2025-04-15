import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/presentation/features/skill/data/model/paystack_checkout_response.dart';
import 'package:kwasu_app/presentation/features/skill/data/repository/paystack_checkout_repo.dart';
import 'package:kwasu_app/utils/enums.dart';

import '../../../../../config/base_state.dart';

class PaystackCheckoutNotifier
    extends AutoDisposeNotifier<BaseState<PaystackCheckoutData>> {
  PaystackCheckoutNotifier();

  late PaystackCheckoutRepository _paystackCheckoutRepository;

  @override
  BaseState<PaystackCheckoutData> build() {
    _paystackCheckoutRepository = ref.read(paystackCheckoutRepositoryProvider);
    return BaseState.initial();
  }

  Future<void> paystackCheckout({
    required Function(String message, String url, String referenceId) onSuccess,
    required Function(String message) onError,
  }) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _paystackCheckoutRepository.paystackCheckout();
      if (!value.status) throw value.message ?? '';

      state = state.copyWith(state: LoadState.success, data: value.data);
      onSuccess(value.message ?? '', value.data?.paymentUrl ?? '',
          value.data?.reference ?? '');
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(state: LoadState.error);
    }
  }
}

final paystackCheckoutNotifier = NotifierProvider.autoDispose<
    PaystackCheckoutNotifier, BaseState<PaystackCheckoutData>>(
  PaystackCheckoutNotifier.new,
);
