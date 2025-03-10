import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/dashboard/presentation/notifier/get_user_details_notifier.dart';
import 'package:kwasu_app/presentation/features/skill/presentation/widgets/course_code_section.dart';
import 'package:kwasu_app/presentation/features/skill/presentation/widgets/course_group_section.dart';
import 'package:kwasu_app/presentation/general_widgets/app_send_button.dart';
import 'package:kwasu_app/presentation/general_widgets/custom_app_bar.dart';

class SkillView extends ConsumerStatefulWidget {
  const SkillView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SkillViewState();
}

class _SkillViewState extends ConsumerState<SkillView> {
  @override
  Widget build(BuildContext context) {
    final userName = ref.watch(getUserDetailsNotifier.select((v) => v.data));
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        userName: '${userName?.firstName} ${userName?.lastName}',
        userLevel: '${userName?.level} lvl',
        userCourse: '',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CourseCodeSection(),
              VerticalSpacing(12),
              CourseGroupSection(),
              VerticalSpacing(26),
              AppSendButton(onTap: () {}, title: 'Proceed')
            ],
          ),
        ),
      )),
    );
  }
}
