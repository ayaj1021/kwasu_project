import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';

class GroupInfoSection extends StatelessWidget {
  const GroupInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Group Information',
          style: AppTextStyles.headlineLarge
              .copyWith(fontSize: 14, color: AppColors.primaryColor),
        ),
        VerticalSpacing(3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GroupInfoContainer(
              icon: 'assets/icons/group_name_icon.svg',
              title: 'Group',
              subTitle: 'Xavier',
            ),
            GroupInfoContainer(
              icon: 'assets/icons/group_number_icon.svg',
              title: 'Group number',
              subTitle: '39',
            ),
            GroupInfoContainer(
              icon: 'assets/icons/whatsapp.svg',
              title: 'Group',
              subTitle: 'Whatsapp link',
            )
          ],
        )
      ],
    );
  }
}

class GroupInfoContainer extends StatelessWidget {
  const GroupInfoContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});
  final String icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: AppColors.secondaryColor,
                    ),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(icon),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                padding: EdgeInsets.all(6.5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: AppColors.primaryColor,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Text(''),
              )
            ],
          ),
          HorizontalSpacing(4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.14,
                child: Text(
                  title,
                  style: AppTextStyles.headlineMedium.copyWith(
                    fontSize: 10,
                    color: AppColors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.14,
                child: Text(
                  subTitle,
                  style: AppTextStyles.headlineLarge.copyWith(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
