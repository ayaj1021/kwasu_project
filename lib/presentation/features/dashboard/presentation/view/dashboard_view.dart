import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/presentation/general_widgets/custom_app_bar.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});
  static const String routeName = '/dashboardView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        userName: 'Moji',
        userLevel: '200 lvl',
        userCourse: 'GNS 202',
      ),
      body: SafeArea(
        child: Center(
          child: Text('Dashboard'),
        ),
      ),
    );
  }
}
