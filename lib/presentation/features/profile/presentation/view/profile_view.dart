import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/home/presentation/notifier/get_group_info_notifier.dart';
import 'package:kwasu_app/presentation/features/home/presentation/notifier/get_user_details_notifier.dart';
import 'package:kwasu_app/presentation/features/home/presentation/view/drawer_view.dart';
import 'package:kwasu_app/presentation/features/profile/presentation/widgets/profile_input_section.dart';
import 'package:kwasu_app/presentation/general_widgets/app_send_button.dart';
import 'package:kwasu_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:kwasu_app/services/data_storage.dart';

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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getUserDetails();

      await setUserDetails();
    });

    super.initState();
  }

  getUserDetails() async {
    final userId = await SecureStorageService().readUserId();
    await ref
        .read(getUserDetailsNotifier.notifier)
        .getUserDetails(id: '$userId');

    await ref.read(getGroupInfoNotifier.notifier).getGroupInfo('$userId');
  }

  setUserDetails() {
    final userName = ref.watch(getUserDetailsNotifier.select((v) => v.data));

    _nameController.text = '${userName?.firstName} ${userName?.lastName}';
    _emailController.text = '${userName?.email}';
  }

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
                        AssetImage('assets/images/user_profile.jpg'),
                  ),
                  HorizontalSpacing(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userName?.firstName} ${userName?.lastName}',
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
                        '${userName?.level}LVL',
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
