import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/auth/presentation/widgets/social_buttons.dart';
import 'package:gap/gap.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SocialLoginButton(
          text: 'تسجيل بواسطة جوجل',
          iconWidget: Icon(Icons.g_mobiledata, color: Colors.red, size: 30),
        ),
        Gap(16),
        SocialLoginButton(
          text: 'تسجيل بواسطة أبل',
          iconWidget: Icon(Icons.apple, color: Colors.black, size: 24),
        ),
        Gap(16),
        SocialLoginButton(
          text: 'تسجيل بواسطة فيسبوك',
          iconWidget: Icon(Icons.facebook, color: Colors.blue, size: 24),
        ),
      ],
    );
  }
}
