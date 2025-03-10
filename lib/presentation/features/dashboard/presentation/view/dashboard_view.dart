import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/presentation/features/attendance/presentation/view/attendance_view.dart';
import 'package:kwasu_app/presentation/features/home/presentation/view/home_view.dart';
import 'package:kwasu_app/presentation/features/profile/presentation/view/profile_view.dart';
import 'package:kwasu_app/presentation/features/skill/presentation/view/skill_view.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});
  static const String routeName = '/dashboardView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    SkillView(),
    AttendanceView(),
    ProfileView()
  ];

  void changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: AppTextStyles.bodysmall.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
          unselectedLabelStyle: AppTextStyles.bodysmall.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
          onTap: changeIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/home.svg'),
                label: 'Home',
                activeIcon: SvgPicture.asset('assets/icons/home_filled.svg')),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/skill.svg'),
                label: 'Skill',
                activeIcon: SvgPicture.asset('assets/icons/skill_filled.svg')),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/attendance.svg'),
                label: 'Attendance',
                activeIcon:
                    SvgPicture.asset('assets/icons/attendance_filled.svg')),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/profile.svg'),
                label: 'Profile',
                activeIcon:
                    SvgPicture.asset('assets/icons/profile_filled.svg')),
          ]),
    );
  }
}
