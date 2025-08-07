import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/home/presentation/notifier/get_user_details_notifier.dart';
import 'package:kwasu_app/presentation/features/home/presentation/view/drawer_view.dart';
import 'package:kwasu_app/presentation/general_widgets/app_send_button.dart';
import 'package:kwasu_app/presentation/general_widgets/custom_app_bar.dart';

class AssignmentView extends ConsumerStatefulWidget {
  const AssignmentView({super.key});
  static const String routeName = '/assignmentView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssignmentViewState();
}

class _AssignmentViewState extends ConsumerState<AssignmentView> {
  @override
  Widget build(BuildContext context) {
    final userName = ref.watch(getUserDetailsNotifier.select((v) => v.data));
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.white,
        child: DrawerView(),
      ),
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        userName: '${userName?.firstName} ${userName?.lastName}',
        userLevel: '${userName?.level} lvl',
        userCourse: '',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assignment Submission',
                style: AppTextStyles.headlineLarge
                    .copyWith(color: AppColors.primaryColor),
              ),
              // Add your assignment list or content here

              VerticalSpacing(13),
              Text(
                'Task Submission',
                style: AppTextStyles.headlineLarge.copyWith(
                  fontSize: 14,
                ),
              ),

              VerticalSpacing(5),
              Text(
                'Arrange your work and upload it in a pdf format',
                style: AppTextStyles.headlineMedium.copyWith(
                  fontSize: 13,
                  color: AppColors.primary262626,
                ),
              ),
              VerticalSpacing(15),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.primaryECFBEC,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.primary959292,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Click to upload file... ',
                        style: AppTextStyles.headlineMedium.copyWith(
                          fontSize: 12,
                          color: AppColors.primary929292,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.upload_file_outlined,
                          color: AppColors.primary929292),
                      onPressed: () {
                        // Handle file upload
                      },
                    ),
                  ],
                ),
              ),
              VerticalSpacing(123),
              AppSendButton(
                // isEnabled: r,
                onTap: () {},
                title: 'Submit',
              )
            ],
          ),
        ),
      ),
    );
  }
}
