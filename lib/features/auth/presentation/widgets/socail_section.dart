import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/auth/presentation/widgets/social_buttons.dart';
import 'package:gap/gap.dart';

class SocialLoginSection extends StatelessWidget {
  final void Function()? google;
  final void Function()? apple;
  final void Function()? facebook;
  const SocialLoginSection({super.key, this.google, this.apple, this.facebook});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginButton(
          onPressed: google,
          text: 'تسجيل بواسطة جوجل',
          iconWidget: Icon(Icons.g_mobiledata, color: Colors.red, size: 30),
        ),
        Gap(16),
        Platform.isIOS
            ? Column(
                children: [
                  SocialLoginButton(
                    onPressed: apple,
                    text: 'تسجيل بواسطة أبل',
                    iconWidget: Icon(
                      Icons.apple,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Gap(16),
                ],
              )
            : SizedBox(),
        SocialLoginButton(
          onPressed: facebook,
          text: 'تسجيل بواسطة فيسبوك',
          iconWidget: Icon(Icons.facebook, color: Colors.blue, size: 24),
        ),
      ],
    );
  }
}
