import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/general_widgets/auth_level_drop_down_widget.dart';
import 'package:kwasu_app/presentation/general_widgets/text_field_widget.dart';

class ProfileInputSection extends StatefulWidget {
  const ProfileInputSection(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.matricNumberController});
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController matricNumberController;

  @override
  State<ProfileInputSection> createState() => _ProfileInputSectionState();
}

class _ProfileInputSectionState extends State<ProfileInputSection> {
  final List<String> studentLevels = [
    '100L',
    '200L',
    '300L',
    '400L',
    '500L',
  ];

  String? selectedLevel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFieldWidget(
          controller: widget.nameController,
          title: 'Name',
          hintText: 'Enter your name',
        ),
        const VerticalSpacing(15),
        AppTextFieldWidget(
          controller: widget.emailController,
          title: 'Email',
          hintText: 'Enter your email',
        ),
        const VerticalSpacing(15),
        AppTextFieldWidget(
          controller: widget.passwordController,
          title: 'Password',
          hintText: 'Enter your password',
        ),
        const VerticalSpacing(15),
        AppTextFieldWidget(
          controller: widget.matricNumberController,
          title: 'Matric Number',
          enabled: false,
          hintText: 'Kwasu/bio/218',
          suffix: SvgPicture.asset(
            'assets/icons/lock.svg',
            fit: BoxFit.scaleDown,
          ),
          //  hintText: 'Enter your matic number',
        ),
        const VerticalSpacing(15),
        AppDropDownWidget(
          selectedItem: selectedLevel,
          hintText: '200 Level',
          title: 'Level',
          items: [],
          icon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SvgPicture.asset('assets/icons/lock.svg'),
          ),
          itemToString: (user) {
            return user;
          },
          onChanged: (value) {
            setState(() {
              selectedLevel = value;
            });
          },
        ),
      ],
    );
  }
}
