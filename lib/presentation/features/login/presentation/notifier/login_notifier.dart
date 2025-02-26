import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/presentation/features/login/data/model/login_request.dart';
import 'package:kwasu_app/presentation/features/login/data/model/login_response.dart';
import 'package:kwasu_app/presentation/features/login/data/repository/login_repository.dart';
import 'package:kwasu_app/services/data_storage.dart';
import 'package:kwasu_app/utils/enums.dart';

import '../../../../../config/base_state.dart';

class LoginNotifier extends AutoDisposeNotifier<BaseState<Data>> {
  LoginNotifier();

  late LoginRepository _loginRepository;
  final SecureStorageService _secureStorageService = SecureStorageService();

  @override
  BaseState<Data> build() {
    _loginRepository = ref.read(loginRepositoryProvider);
    return BaseState.initial();
  }

  Future<void> login({
    required LoginRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _loginRepository.login(data);
      if (!value.status) throw value.message ?? '';

      final token = value.data?.access;
      final refreshToken = value.data?.refresh;
      await _secureStorageService.writeAccessToken(token: token);
      await _secureStorageService.writeRefreshToken(token: refreshToken);

      state = state.copyWith(state: LoadState.success, data: value.data);
      onSuccess(value.message ?? '');
    } catch (e) {
      state = state.copyWith(state: LoadState.error);
      onError(e.toString());
    }
  }
}

final loginNotifier =
    NotifierProvider.autoDispose<LoginNotifier, BaseState<Data>>(
  LoginNotifier.new,
);
