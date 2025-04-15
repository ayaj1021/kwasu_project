import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/extensions/navigation.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/login/presentation/view/login_view.dart';
import 'package:kwasu_app/presentation/general_widgets/app_send_button.dart';
import 'package:kwasu_app/presentation/general_widgets/auth_header.dart';
import 'package:kwasu_app/presentation/general_widgets/auth_level_drop_down_widget.dart';
import 'package:kwasu_app/presentation/general_widgets/text_field_widget.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});
  static const String routeName = '/signUpView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final ValueNotifier<bool> _isLoginEnabled = ValueNotifier(false);
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  late TextEditingController _passwordController;
  late TextEditingController _matricNumberController;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _matricNumberController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController()..addListener(_validateInput);
    _emailController = TextEditingController()..addListener(_validateInput);
    _passwordController = TextEditingController()..addListener(_validateInput);
    _matricNumberController = TextEditingController()
      ..addListener(_validateInput);
  }

  void _validateInput() {
    _isLoginEnabled.value = _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _matricNumberController.text.isNotEmpty;
  }

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
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 190),
            child: Image.asset('assets/images/auth_backdrop.png'),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                children: [
                  AuthHeader(
                    title: 'Get started',
                    subTitle: 'Already have an account?',
                    textButton: 'Login',
                    onTap: () => context.pushNamed(LoginView.routeName),
                  ),
                  const VerticalSpacing(16),
                  AppTextFieldWidget(
                    controller: _nameController,
                    title: 'Name',
                    hintText: 'Enter your name',
                  ),
                  const VerticalSpacing(15),
                  AppTextFieldWidget(
                    controller: _emailController,
                    title: 'Email',
                    hintText: 'Enter your email',
                  ),
                  const VerticalSpacing(15),
                  AppTextFieldWidget(
                    controller: _passwordController,
                    title: 'Password',
                    hintText: 'Enter your password',
                  ),
                  const VerticalSpacing(15),
                  AppTextFieldWidget(
                    controller: _matricNumberController,
                    title: 'Matric Number',
                    hintText: 'Enter your matic number',
                  ),
                  const VerticalSpacing(15),
                  AppDropDownWidget(
                    selectedItem: selectedLevel,
                    hintText: 'Select your level',
                    title: 'Level',
                    items: studentLevels,
                    itemToString: (user) {
                      return user;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedLevel = value;
                      });
                    },
                  ),
                  VerticalSpacing(90),
                  ValueListenableBuilder(
                      valueListenable: _isLoginEnabled,
                      builder: (context, r, c) {
                        return AppSendButton(
                          isEnabled: r,
                          onTap: () => _signUp(),
                          title: 'Sign up',
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void _signUp() {
    // final request = LoginRequest(
    //     email: _emailController.text.trim(),
    //     password: _passwordController.text.trim());

    // ref.read(loginNotifier.notifier).login(
    //     data: request,
    //     onError: (error) {
    //       context.showError(message: error);
    //     },
    //     onSuccess: (message) {
    //       context.showSuccess(message: 'Login Successful');
    //       context.pushNamed(DashboardView.routeName);
    //     });
  }
}
