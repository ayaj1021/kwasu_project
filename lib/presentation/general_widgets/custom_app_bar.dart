import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.titleWidget,
    this.leading,
    this.title,
    this.userName,
    this.userLevel,
    this.userCourse,
    this.elevation = 0,
    this.centerTitle,
    this.backgroundColor,
  });
  final Widget? titleWidget;
  final Widget? leading;
  final String? title;
  final String? userName;
  final String? userLevel;
  final String? userCourse;

  final double elevation;
  final bool? centerTitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leading: leading ??
          SvgPicture.asset(
            'assets/icons/menu_icon.svg',
            fit: BoxFit.scaleDown,
          ),
      actions: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/notification.svg'),
                  HorizontalSpacing(10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '$userName',
                            style: AppTextStyles.headlineSmall,
                          ),
                          Row(
                            children: [
                              Text(
                                '$userLevel',
                                style: AppTextStyles.headlineMedium.copyWith(
                                    fontSize: 10,
                                    color: AppColors.primaryColor),
                              ),
                              HorizontalSpacing(4),
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: AppColors.primaryBCDFBC,
                              ),
                              HorizontalSpacing(4),
                              Text(
                                '$userCourse',
                                style: AppTextStyles.headlineMedium.copyWith(
                                    fontSize: 10,
                                    color: AppColors.primaryB7802C),
                              ),
                            ],
                          )
                        ],
                      ),
                      HorizontalSpacing(5),
                      CircleAvatar(
                        radius: 20,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
