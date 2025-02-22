import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/general_widgets/app_send_button.dart';
import 'package:kwasu_app/presentation/general_widgets/auth_header.dart';
import 'package:kwasu_app/presentation/general_widgets/text_field_widget.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
  static const String routeName = '/loginView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              children: [
                const AuthHeader(
                  title: 'Welcome back',
                  subTitle: 'Don\'t have an account?',
                  textButton: 'Sign up',
                ),
                const VerticalSpacing(16),
                TextFieldWidget(
                  title: 'Name',
                  hintText: 'Enter your name',
                ),
                const VerticalSpacing(15),
                TextFieldWidget(
                  title: 'Password',
                  hintText: 'Enter your password',
                ),
                const VerticalSpacing(45),
                AppSendButton(
                  onTap: () {},
                  title: 'Login',
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
