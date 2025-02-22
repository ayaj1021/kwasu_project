import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwasu_app/core/theme/colors.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryBFE7BF,
        ),
        child: SvgPicture.asset('assets/icons/support.svg'),
      ),
    );
  }
}
