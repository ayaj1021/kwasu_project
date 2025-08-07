import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/skill/presentation/notifier/get_all_skills_notifier.dart';
import 'package:kwasu_app/presentation/features/skill/presentation/view/skill_details_view.dart';
import 'package:kwasu_app/presentation/general_widgets/app_send_button.dart';
import 'package:kwasu_app/presentation/general_widgets/search_bar_widget.dart';

class CourseCodeSection extends ConsumerStatefulWidget {
  const CourseCodeSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CourseCodeSectionState();
}

class _CourseCodeSectionState extends ConsumerState<CourseCodeSection> {
  final _searchController = TextEditingController();
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(getAllSkillsNotifier.notifier).getAllSkills();
    });
  }

  String _searchQuery = '';
  String courseTitle = '';
  String coursePrice = '';
  @override
  Widget build(BuildContext context) {
    final skillSet =
        ref.watch(getAllSkillsNotifier.select((v) => v.data ?? []));

    List<String?> filteredCourseCodes =

        //skills.where((skill) {
        skillSet.map((e) => e.code).where((skill) {
      final matchesSearch =
          _searchQuery.isEmpty || (skill!.toLowerCase().contains(_searchQuery));

      return matchesSearch;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Course Code',
          style: AppTextStyles.headlineLarge
              .copyWith(color: AppColors.primaryColor),
        ),
        VerticalSpacing(10),
        SearchBarWidget(
            hintText: 'Select course code',
            searchController: _searchController,
            onChanged: (query) {
              setState(() {
                _searchQuery = query.toLowerCase();
              });
            }),
        VerticalSpacing(5),
        filteredCourseCodes.isEmpty
            ? Center(
                child: Text('No skills available'),
              )
            : Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white),
                child: Column(
                  children: List.generate(filteredCourseCodes.length, (index) {
                    final code = filteredCourseCodes[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, top: 12, right: 40),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                                courseTitle = skillSet
                                        .firstWhere((e) => e.code == code)
                                        .title ??
                                    '';
                                coursePrice = skillSet
                                        .firstWhere((e) => e.code == code)
                                        .price ??
                                    '';
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  code ?? '',
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
                        ),
                        VerticalSpacing(40),
                        AppSendButton(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      content: SkillDetailsView(
                                        courseCode: code ?? '',
                                        courseTitle: courseTitle,
                                        courseAmount: coursePrice,
                                      ),
                                    );
                                  });
                            },
                            title: 'Proceed')
                      ],
                    );
                  }),
                )),
      ],
    );
  }
}
