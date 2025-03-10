import 'package:flutter/material.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller,
      this.enabled,
      this.suffix});
  final String title;
  final String hintText;
  final bool? enabled;
  final Widget? suffix;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                enabled: enabled,
                controller: controller,
                decoration: InputDecoration(
                    hintText: hintText,
                    suffixIcon: suffix,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 20,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              title,
              style: AppTextStyles.headlineMedium.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
