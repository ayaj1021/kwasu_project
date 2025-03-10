import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget(
      {super.key,
      required this.hintText,
      required this.searchController,
      required this.onChanged});
  final String hintText;
  final TextEditingController searchController;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/search.svg'),
          HorizontalSpacing(10),
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: AppTextStyles.headlineMedium.copyWith(
                  fontSize: 13,
                ),
              ),
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}
