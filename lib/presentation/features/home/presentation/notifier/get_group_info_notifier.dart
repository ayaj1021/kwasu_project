import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/presentation/features/home/data/model/get_group_info_response.dart';
import 'package:kwasu_app/presentation/features/home/data/repository/get_group_info_repository.dart';
import 'package:kwasu_app/utils/enums.dart';

import '../../../../../config/base_state.dart';

class GetGroupInfoNotifier
    extends AutoDisposeNotifier<BaseState<List<GetGroupInfoData>>> {
  GetGroupInfoNotifier();

  late GetGroupInfoRepository _repository;

  @override
  BaseState<List<GetGroupInfoData>> build() {
    _repository = ref.read(getGroupInfoRepositoryProvider);
    return BaseState.initial();
  }

  Future<void> getGroupInfo(String id) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _repository.getGroupInfo(id);
      if (!value.status) throw value.message ?? '';

      state = state.copyWith(state: LoadState.success, data: value.data);
      //  onSuccess(value.message ?? '');
    } catch (e) {
      state = state.copyWith(state: LoadState.error);
      //  onError(e.toString());
    }
  }
}

final getGroupInfoNotifier = NotifierProvider.autoDispose<GetGroupInfoNotifier,
    BaseState<List<GetGroupInfoData>>>(
  GetGroupInfoNotifier.new,
);
