import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/home/data/model/get_group_info_response.dart';

class GroupInfoSection extends StatelessWidget {
  const GroupInfoSection({super.key, required this.groupList});
  final List<GetGroupInfoData> groupList;

  @override
  Widget build(BuildContext context) {
    final groupNumber = groupList.map((e) => e.members).toList();
    final groupName = groupList.map((e) => e.name).toList();
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
              subTitle: '${groupName.first}',
            ),
            GroupInfoContainer(
              icon: 'assets/icons/group_number_icon.svg',
              title: 'Group number',
              // subTitle: '${groupNumber.map((e) => e?.length).toList()}',
              subTitle: '${groupNumber.first?.length}',
            ),
            GroupInfoContainer(
              icon: 'assets/icons/whatsapp.svg',
              title: 'Group',
              subTitle: 'Whatsapp',
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
      width: MediaQuery.sizeOf(context).width * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.transparent,
                    ),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                  icon,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                padding: EdgeInsets.all(6),
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
          HorizontalSpacing(3),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                width: MediaQuery.of(context).size.width * 0.1,
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
