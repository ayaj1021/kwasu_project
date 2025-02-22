import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/general_widgets/customer_support.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.textButton});
  final String title;
  final String subTitle;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 61.h,
            width: 180.w,
            child: Image.asset('assets/images/auth_logo.png'),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CustomerSupport(),
        ),
        VerticalSpacing(3),
        Text(
          title,
          style: AppTextStyles.bodyLarge.copyWith(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              color: AppColors.black),
        ),
        Row(
          children: [
            Text(
              subTitle,
              style: AppTextStyles.headlineMedium
                  .copyWith(fontSize: 16, color: AppColors.primary6E6E6E),
            ),
            HorizontalSpacing(4),
            Text(
              textButton,
              style: AppTextStyles.headlineLarge.copyWith(
                fontSize: 18,
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
