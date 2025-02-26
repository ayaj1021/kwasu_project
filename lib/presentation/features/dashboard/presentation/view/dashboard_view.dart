import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/dashboard/presentation/notifier/get_user_details_notifier.dart';
import 'package:kwasu_app/presentation/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:kwasu_app/presentation/features/dashboard/presentation/widgets/group_info_section.dart';
import 'package:kwasu_app/presentation/features/dashboard/presentation/widgets/pratical_information_section.dart';
import 'package:kwasu_app/presentation/features/dashboard/presentation/widgets/task_completion_graph.dart';
import 'package:kwasu_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:kwasu_app/services/data_storage.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});
  static const String routeName = '/dashboardView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
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
  }

  @override
  Widget build(BuildContext context) {
    final userName = ref.watch(getUserDetailsNotifier.select((v) => v.data));
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        userName: '${userName?.firstName} ${userName?.lastName}',
        userLevel: '${userName?.level} lvl',
        userCourse: '',
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DashBoardHeader(userName: userName),
            VerticalSpacing(11),
            GroupInfoSection(),
            VerticalSpacing(19),
            TaskCompletionGraph(),
            VerticalSpacing(10),
            PracticalInformationSection()
          ],
        ),
      )),
    );
  }
}
