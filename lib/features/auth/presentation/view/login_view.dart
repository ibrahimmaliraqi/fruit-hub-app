import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/router/app_router.dart';
import 'package:fruit_hub_app/core/theme/app_colors.dart';
import 'package:fruit_hub_app/core/widgets/app_bar.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_app/core/widgets/loading.dart';
import 'package:fruit_hub_app/core/widgets/snack.dart';
import 'package:fruit_hub_app/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:fruit_hub_app/features/auth/presentation/widgets/socail_section.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController.text = "ibrahim@gmail.com";
    passwordController.text = "07700770";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "تسجيل الدخول"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(10),
                CustomTextField(
                  hintText: 'البريد الإلكتروني',
                  controller: emailController,
                ),
                Gap(16),
                CustomTextField(
                  hintText: 'كلمة المرور',
                  isPassword: true,
                  controller: passwordController,
                ),
                Gap(12),
                ForgotPasswordButton(),
                Gap(32),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      Snack.show(
                        context,
                        message: state.errorMessage,
                        isError: true,
                      );
                    }
                    if (state is LoginSuccess) {
                      Snack.show(
                        context,
                        message: 'تم تسجيل الدخول بنجاح!',
                        isError: false,
                      );
                      print('User created: ${state.user.email}');
                      print('User created: ${state.user.name}');
                      print('User created: ${state.user.uId}');

                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouter.homeView);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return Loading();
                    }
                    return CustomButton(
                      text: 'تسجيل الدخول',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          );
                        }
                      },
                    );
                  },
                ),
                Gap(16),
                SignUpLink(),
                Gap(32),
                DividerWithText(text: 'أو'),
                Gap(24),
                SocialLoginSection(
                  google: () => context.read<LoginCubit>().signInWithGoogle(),
                ),
              ],
            ),
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
