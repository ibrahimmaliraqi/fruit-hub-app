import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/router/app_router.dart';
import 'package:fruit_hub_app/core/services/server_locator.dart';
import 'package:fruit_hub_app/core/widgets/app_bar.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_app/core/widgets/loading.dart';
import 'package:fruit_hub_app/core/widgets/snack.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:fruit_hub_app/features/auth/presentation/manager/sign_up/sign_up_cubit.dart';
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
  void initState() {
    emailController.text = "ibrahim@gmail.com";
    passwordController.text = "07700770";
    nameController.text = "ابراهيم محمد";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(signUpUsecase: getIt<SignUpUsecase>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: 'إنشاء حساب',
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
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
                  BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpFailure) {
                        Snack.show(
                          context,
                          message: state.errorMessage,
                          isError: true,
                        );
                      }
                      if (state is SignUpSuccess) {
                        Snack.show(
                          context,
                          message: 'تم إنشاء الحساب بنجاح!',
                          isError: false,
                        );
                        print('User created: ${state.user.email}');
                        print('User created: ${state.user.name}');
                        print('User created: ${state.user.uId}');

                        GoRouter.of(
                          context,
                        ).pushReplacement(AppRouter.loginView);
                      }
                    },
                    builder: (context, state) {
                      if (state is SignUpLoading) {
                        return const Loading();
                      }
                      return CustomButton(
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
                            context.read<SignUpCubit>().signUp(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const LoginLink(),
                ],
              ),
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
