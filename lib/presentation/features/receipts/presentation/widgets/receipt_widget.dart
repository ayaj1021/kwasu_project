import 'package:flutter/material.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';

class ReceiptWidget extends StatelessWidget {
  const ReceiptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReceiptTextWidget(
                title: 'Course Code',
                subTitle: 'GNS 243',
              ),
              SizedBox(height: 4),
              ReceiptTextWidget(
                title: 'Payment',
                subTitle: 'Transfer to Bank',
              ),
              SizedBox(height: 4),
              ReceiptTextWidget(
                title: 'Amount',
                subTitle: 'N1100',
              ),
              SizedBox(height: 4),
              ReceiptTextWidget(
                title: 'Status',
                subTitle: 'Success',
                statusColor: AppColors.primary58AE58,
              ),
              SizedBox(height: 4),
              ReceiptTextWidget(
                title: 'Date',
                subTitle: '24th February, 2025',
              ),
            ],
          ),
          Text(
            'Download',
            style: AppTextStyles.headlineLarge
                .copyWith(fontSize: 14, color: AppColors.secondaryColor),
          )
        ],
      ),
    );
  }
}

class ReceiptTextWidget extends StatelessWidget {
  const ReceiptTextWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.statusColor,
  });
  final String title;
  final String subTitle;
  final Color? statusColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:',
          style: AppTextStyles.headlineLarge.copyWith(
            fontSize: 14,
          ),
        ),
        HorizontalSpacing(5),
        Text(
          subTitle,
          style: AppTextStyles.headlineMedium.copyWith(
            fontSize: 13,
            color: statusColor ?? AppColors.primary262626,
          ),
        ),
      ],
    );
  }
}
