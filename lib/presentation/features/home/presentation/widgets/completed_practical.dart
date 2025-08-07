import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';

class CompletedPractical extends ConsumerStatefulWidget {
  const CompletedPractical({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CompletedPracticalState();
}

class _CompletedPracticalState extends ConsumerState<CompletedPractical> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'List of Completed Practical',
            style: AppTextStyles.headlineLarge
                .copyWith(fontSize: 12, color: AppColors.black),
          ),
          VerticalSpacing(15),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    CompletedPracticalWidget(
                      title: 'Breeding of Tilapia Fish',
                      date: 'Aug 17, 2024',
                      time: ' 11:59pm',
                    ),
                    VerticalSpacing(10),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CompletedPracticalWidget extends StatelessWidget {
  const CompletedPracticalWidget({
    super.key,
    required this.title,
    required this.date,
    required this.time,
  });
  final String title;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: AppColors.primary9BCE9B,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            HorizontalSpacing(5),
            Text(
              title,
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.primary262626,
                fontSize: 13,
              ),
            ),
          ],
        ),
        Text(
          '$date, $time',
          style: AppTextStyles.headlineMedium.copyWith(
            color: AppColors.primary262626,
            fontSize: 13,
          ),
        )
      ],
    );
  }
}
