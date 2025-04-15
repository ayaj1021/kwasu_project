import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/presentation/features/home/data/model/user_details_response.dart';
import 'package:kwasu_app/presentation/features/home/data/repository/user_details_repository.dart';
import 'package:kwasu_app/utils/enums.dart';

import '../../../../../config/base_state.dart';

class GetUserDetailsNotifier
    extends AutoDisposeNotifier<BaseState<UserDetailsData>> {
  GetUserDetailsNotifier();

  late UserDetailsRepository _userDetailsRepository;

  @override
  BaseState<UserDetailsData> build() {
    _userDetailsRepository = ref.read(getUserDetailsRepositoryProvider);
    return BaseState.initial();
  }

  Future<void> getUserDetails({
    required String id,
    // required void Function(String error) onError,
    // required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _userDetailsRepository.getUserDetails(id);
      if (!value.status) throw value.message ?? '';

      state = state.copyWith(state: LoadState.success, data: value.data);
      //  onSuccess(value.message ?? '');
    } catch (e) {
      state = state.copyWith(state: LoadState.error);
      //  onError(e.toString());
    }
  }
}

final getUserDetailsNotifier = NotifierProvider.autoDispose<
    GetUserDetailsNotifier, BaseState<UserDetailsData>>(
  GetUserDetailsNotifier.new,
);
