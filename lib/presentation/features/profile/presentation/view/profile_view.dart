import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/home/presentation/notifier/get_user_details_notifier.dart';
import 'package:kwasu_app/presentation/features/profile/presentation/widgets/profile_input_section.dart';
import 'package:kwasu_app/presentation/general_widgets/app_send_button.dart';
import 'package:kwasu_app/presentation/general_widgets/custom_app_bar.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _matricNumberController = TextEditingController();

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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: AppTextStyles.headlineLarge
                    .copyWith(color: AppColors.primaryColor),
              ),
              VerticalSpacing(32),
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage:
                        AssetImage('assets/images/student_image.png'),
                  ),
                  HorizontalSpacing(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olusanmi Pelumi',
                        style:
                            AppTextStyles.headlineLarge.copyWith(fontSize: 16),
                      ),
                      VerticalSpacing(2),
                      Text(
                        'Biological Science',
                        style: AppTextStyles.headlineLarge.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      VerticalSpacing(2),
                      Text(
                        '200LVL',
                        style: AppTextStyles.headlineLarge.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              VerticalSpacing(23),
              ProfileInputSection(
                nameController: _nameController,
                emailController: _emailController,
                passwordController: _passwordController,
                matricNumberController: _matricNumberController,
              ),
              VerticalSpacing(30),
              AppSendButton(onTap: () {}, title: 'Save Changes')
            ],
          ),
        ),
      )),
    );
  }
}
