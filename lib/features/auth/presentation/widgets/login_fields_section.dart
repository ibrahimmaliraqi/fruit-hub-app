import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';

class InputFieldsSection extends StatefulWidget {
  const InputFieldsSection({super.key});

  @override
  State<InputFieldsSection> createState() => _InputFieldsSectionState();
}

class _InputFieldsSectionState extends State<InputFieldsSection> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
