import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/presentation/features/skill/data/model/get_all_skills_response.dart';
import 'package:kwasu_app/presentation/features/skill/data/repository/get_all_skills_repository.dart';
import 'package:kwasu_app/utils/enums.dart';

import '../../../../../config/base_state.dart';

class GetAllSkillsNotifier
    extends AutoDisposeNotifier<BaseState<List<GetAllSkillsData>>> {
  GetAllSkillsNotifier();

  late GetAllSkillsRepository _getAllSkillsRepository;

  @override
  BaseState<List<GetAllSkillsData>> build() {
    _getAllSkillsRepository = ref.read(getAllSkillsRepositoryProvider);
    return BaseState.initial();
  }

  Future<void> getAllSkills() async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _getAllSkillsRepository.getAllSkills();
      if (!value.status) throw value.message ?? '';

      state = state.copyWith(state: LoadState.success, data: value.data);
      //  onSuccess(value.message ?? '');
    } catch (e) {
      state = state.copyWith(state: LoadState.error);
      //  onError(e.toString());
    }
  }
}

final getAllSkillsNotifier = NotifierProvider.autoDispose<GetAllSkillsNotifier,
    BaseState<List<GetAllSkillsData>>>(
  GetAllSkillsNotifier.new,
);
