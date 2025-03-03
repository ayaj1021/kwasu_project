import 'package:flutter/material.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/dashboard/data/model/user_details_response.dart';

class DashBoardHeader extends StatelessWidget {
  const DashBoardHeader({
    super.key,
    required this.userName,
  });

  final UserDetailsData? userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back ${userName?.firstName}! 👋',
          style: AppTextStyles.displaySmall.copyWith(
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          'Stay up to date with your VTE course',
          style: AppTextStyles.labelSmall.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        VerticalSpacing(10),
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.primary7ABE7A.withValues(alpha: 0.5),
          ),
        )
      ],
    );
  }
}
