import 'package:flutter/material.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';

class TaskCompletionGraph extends StatelessWidget {
  const TaskCompletionGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 9, left: 10, right: 10, bottom: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        VerticalSpacing(30),
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
