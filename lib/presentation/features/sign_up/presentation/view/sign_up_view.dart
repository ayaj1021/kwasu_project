import 'package:flutter/material.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/general_widgets/app_send_button.dart';
import 'package:kwasu_app/presentation/general_widgets/auth_header.dart';
import 'package:kwasu_app/presentation/general_widgets/text_field_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
    String? _selectedLevel; 
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _matricController;
  late TextEditingController _passwordController;
  late TextEditingController _levelController;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _matricController.dispose();
    _levelController.dispose();

    super.dispose();
  }

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
                    subTitle: 'Already have an account?',
                    textButton: 'Login',
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
                    controller: _matricController,
                    title: 'Matric Number',
                    hintText: 'Enter your matric number',
                  ),
                  const VerticalSpacing(15),
                 DropdownButtonFormField<String>(
  value: _selectedLevel,
  decoration: InputDecoration(
    labelText: 'Level',
    hintText: 'Select your level',
    border: OutlineInputBorder(),
  ),
  items: [
    DropdownMenuItem(value: 'Beginner', child: Text('Beginner')),
    DropdownMenuItem(value: 'Intermediate', child: Text('Intermediate')),
    DropdownMenuItem(value: 'Advanced', child: Text('Advanced')),
  ],
  onChanged: (String? newValue) {
    setState(() {
      _selectedLevel = newValue!;
    });
  },
                 ),
                
                                    const VerticalSpacing(45),

                   AppSendButton(
                          isEnabled: r,
                          onTap: () => _login(),
                          title: 'Sign up',
                        );
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
