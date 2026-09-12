import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/router/app_router.dart';
import 'package:fruit_hub_app/core/theme/app_colors.dart';
import 'package:fruit_hub_app/core/widgets/app_bar.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/features/auth/presentation/widgets/login_fields_section.dart';
import 'package:fruit_hub_app/features/auth/presentation/widgets/socail_section.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "تسجيل الدخول"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(10),
              InputFieldsSection(),
              Gap(12),
              ForgotPasswordButton(),
              Gap(32),
              CustomButton(text: 'تسجيل الدخول'),
              Gap(16),
              SignUpLink(),
              Gap(32),
              DividerWithText(text: 'أو'),
              Gap(24),
              SocialLoginSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Text(
          'نسيت كلمة المرور؟',
          style: TextStyle(
            color: AppColors.primaryColor, // Dark green
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'لا تمتلك حساب؟ ',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        GestureDetector(
          onTap: () =>
              GoRouter.of(context).pushReplacement(AppRouter.signUpView),
          child: const Text(
            'قم بإنشاء حساب',
            style: TextStyle(
              color: Color(0xFF1B5E20), // Dark green
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
      ],
    );
  }
}
