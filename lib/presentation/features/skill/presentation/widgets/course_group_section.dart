import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/general_widgets/search_bar_widget.dart';

class CourseGroupSection extends ConsumerStatefulWidget {
  const CourseGroupSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CourseGroupSectionState();
}

class _CourseGroupSectionState extends ConsumerState<CourseGroupSection> {
  final _searchController = TextEditingController();
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    filteredCourseCodes = List.from(courseGroups);
  }

  List<String> filteredCourseCodes = [];
  void _filterCourseCodes(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCourseCodes = List.from(courseGroups);
      } else {
        filteredCourseCodes = courseGroups
            .where((code) => code.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Course Group',
          style: AppTextStyles.headlineLarge
              .copyWith(color: AppColors.primaryColor),
        ),
        VerticalSpacing(10),
        SearchBarWidget(
          hintText: 'Select course group',
          searchController: _searchController,
          onChanged: _filterCourseCodes,
        ),
        VerticalSpacing(5),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: AppColors.white),
          child: Column(
              children: List.generate(filteredCourseCodes.length, (index) {
            final code = filteredCourseCodes[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 12, right: 40),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          code,
                          style: AppTextStyles.headlineMedium
                              .copyWith(fontSize: 13),
                        ),
                        _selectedIndex == index
                            ? SvgPicture.asset(
                                'assets/icons/selected_item_icon.svg')
                            : SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
                VerticalSpacing(10),
                Divider(
                  color: AppColors.primaryA4D4E0,
                )
              ],
            );
          })),
        ),
      ],
    );
  }
}

final List<String> courseGroups = [
  'TAILORING',
  'HAIR DRESSING',
  // 'ADIRE',
  // 'AUTO CAD',
  // 'BLOCK MAKING',
  // 'WEB DESIGN AND APP DESIGN',
  // 'POULTRY',
];
