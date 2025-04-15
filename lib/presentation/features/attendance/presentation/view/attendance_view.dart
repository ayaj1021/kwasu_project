import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/presentation/features/home/presentation/notifier/get_user_details_notifier.dart';
import 'package:kwasu_app/presentation/general_widgets/custom_app_bar.dart';

class AttendanceView extends ConsumerStatefulWidget {
  const AttendanceView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends ConsumerState<AttendanceView> {
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
    );
  }
}
