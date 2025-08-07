import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/home/presentation/notifier/get_group_info_notifier.dart';
import 'package:kwasu_app/presentation/features/home/presentation/notifier/get_user_details_notifier.dart';
import 'package:kwasu_app/presentation/features/home/presentation/view/drawer_view.dart';
import 'package:kwasu_app/presentation/features/home/presentation/widgets/completed_practical.dart';
import 'package:kwasu_app/presentation/features/home/presentation/widgets/dashboard_header.dart';
import 'package:kwasu_app/presentation/features/home/presentation/widgets/group_info_section.dart';
import 'package:kwasu_app/presentation/features/home/presentation/widgets/pratical_information_section.dart';
import 'package:kwasu_app/presentation/features/home/presentation/widgets/task_completion_graph.dart';
import 'package:kwasu_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:kwasu_app/services/data_storage.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getUserDetails();
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

  @override
  Widget build(BuildContext context) {
    final userName = ref.watch(getUserDetailsNotifier.select((v) => v.data));
    final groupList = ref.watch(getGroupInfoNotifier.select((v) => v.data));
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.white,
        child: DrawerView(),
      ),
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        userName: '${userName?.firstName ?? ''} ${userName?.lastName ?? ''}',
        userLevel: '${userName?.level ?? ''} lvl',
        userCourse: '',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              DashBoardHeader(userName: userName),
              VerticalSpacing(11),
              GroupInfoSection(
                groupList: groupList ?? [],
              ),
              VerticalSpacing(19),
              TaskCompletionGraph(),
              VerticalSpacing(10),
              PracticalInformationSection(),
              VerticalSpacing(10),
              CompletedPractical(),
            ],
          ),
        ),
      )),
    );
  }
}
