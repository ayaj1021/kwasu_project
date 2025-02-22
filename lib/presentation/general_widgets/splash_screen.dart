import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwasu_app/core/extensions/navigation.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/login/presentation/view/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: height,
              child: Image.asset(
                'assets/images/backdrop.png',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 100.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 76.h,
                    width: 260.w,
                    child: Image.asset(
                      'assets/logo/kwasu_text_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  VerticalSpacing(7),
                  Text(
                    'Center For \nEntrepreneurs \nPayment Platform',
                    style: AppTextStyles.displayLarge
                        .copyWith(color: AppColors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  VerticalSpacing(28),
                  GestureDetector(
                    onTap: () =>
                        context.pushReplacementNamed(LoginView.routeName),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 110),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                          color: AppColors.white),
                      child: Text(
                        'Get started',
                        style: AppTextStyles.headlineLarge.copyWith(
                          color: AppColors.primary123512,
                        ),
                      ),
                    ),
                  ),
                  VerticalSpacing(90),
                  SizedBox(
                    // height: 76.h,
                    // width: 260.w,
                    child: Image.asset(
                      'assets/images/students.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
