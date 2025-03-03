import 'package:flutter/material.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';

class PracticalInformationSection extends StatelessWidget {
  const PracticalInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Practical Information',
          style: AppTextStyles.headlineLarge
              .copyWith(fontSize: 14, color: AppColors.primaryColor),
        ),
        VerticalSpacing(10),
        Container(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                'List of Available Practical',
                style: AppTextStyles.headlineSmall
                    .copyWith(fontSize: 12, color: AppColors.black),
              ),
              VerticalSpacing(12),
              Row(
                children: [
                  Text('Task'),
                  Text('Due Date'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
