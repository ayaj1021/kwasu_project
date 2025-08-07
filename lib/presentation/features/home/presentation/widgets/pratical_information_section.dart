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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List of Available Practical',
                style: AppTextStyles.headlineSmall
                    .copyWith(fontSize: 12, color: AppColors.black),
              ),
              VerticalSpacing(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Task',
                          style: AppTextStyles.headlineMedium.copyWith(),
                        ),
                        VerticalSpacing(5),
                        Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: AppColors.primaryE8BB78,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            HorizontalSpacing(5),
                            Text(
                              'Breeding of Tilapia Fish',
                              style: AppTextStyles.headlineMedium.copyWith(
                                color: AppColors.primary262626,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Due Date',
                          style: AppTextStyles.headlineLarge.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          'Aug 17, 2024, 11:59pm',
                          style: AppTextStyles.headlineMedium.copyWith(
                            color: AppColors.primary262626,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
