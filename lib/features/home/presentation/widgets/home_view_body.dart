import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        Gap(16),
      ],
    );
  }
}
