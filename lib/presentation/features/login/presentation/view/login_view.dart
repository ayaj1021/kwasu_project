import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/extensions/navigation.dart';
import 'package:kwasu_app/core/extensions/overlay_extension.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:kwasu_app/presentation/features/login/data/model/login_request.dart';
import 'package:kwasu_app/presentation/features/login/presentation/notifier/login_notifier.dart';
import 'package:kwasu_app/presentation/general_widgets/app_send_button.dart';
import 'package:kwasu_app/presentation/general_widgets/auth_header.dart';
import 'package:kwasu_app/presentation/general_widgets/text_field_widget.dart';
import 'package:kwasu_app/utils/enums.dart';
import 'package:kwasu_app/utils/page_loader.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
  static const String routeName = '/loginView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final ValueNotifier<bool> _isLoginEnabled = ValueNotifier(false);
  late TextEditingController _emailController;

  late TextEditingController _passwordController;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController()..addListener(_validateInput);
    _passwordController = TextEditingController()..addListener(_validateInput);
  }

  void _validateInput() {
    _isLoginEnabled.value =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(loginNotifier.select((v) => v.state.isLoading));
    return Scaffold(
      body: PageLoader(
        isLoading: isLoading,
        child: SafeArea(
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
                  AppTextFieldWidget(
                    controller: _emailController,
                    title: 'Name',
                    hintText: 'Enter your name',
                  ),
                  const VerticalSpacing(15),
                  AppTextFieldWidget(
                    controller: _passwordController,
                    title: 'Password',
                    hintText: 'Enter your password',
                  ),
                  const VerticalSpacing(45),
                  ValueListenableBuilder(
                      valueListenable: _isLoginEnabled,
                      builder: (context, r, c) {
                        return AppSendButton(
                          isEnabled: r,
                          onTap: () => _login(),
                          title: 'Login',
                        );
                      })
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  void _login() {
    final request = LoginRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    ref.read(loginNotifier.notifier).login(
        data: request,
        onError: (error) {
          context.showError(message: error);
        },
        onSuccess: (message) {
          context.showSuccess(message: 'Login Successful');
          context.pushNamed(DashboardView.routeName);
        });
  }
}
