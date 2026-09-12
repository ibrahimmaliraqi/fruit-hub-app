import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/router/app_router.dart';
import 'package:fruit_hub_app/core/widgets/app_bar.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_app/core/widgets/snack.dart';
import 'package:fruit_hub_app/features/auth/presentation/widgets/term_accept_widget.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'إنشاء حساب',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  hintText: 'الاسم كامل',
                  controller: nameController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'البريد الإلكتروني',
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'كلمة المرور',
                  isPassword: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 16),
                TermsAndConditionsCheckbox(
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'إنشاء حساب',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (!isChecked) {
                        Snack.show(
                          context,
                          message: 'يرجى قبول الشروط والأحكام.',
                          isError: true,
                        );
                        return;
                      }
                      print('Name: ${nameController.text}');
                      print('Email: ${emailController.text}');
                      print('Password: ${passwordController.text}');
                    }
                  },
                ),
                const SizedBox(height: 16),
                const LoginLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginLink extends StatelessWidget {
  const LoginLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'تمتلك حساب بالفعل؟ ',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: () =>
              GoRouter.of(context).pushReplacement(AppRouter.loginView),
          child: const Text(
            'تسجيل دخول',
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
