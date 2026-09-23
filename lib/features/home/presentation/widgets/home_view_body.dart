import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruit_hub_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:fruit_hub_app/features/home/presentation/widgets/home_banner_list.dart';
import 'package:fruit_hub_app/features/home/presentation/widgets/home_search.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          HomeAppBar(),
          Gap(16),
          HomeSearchField(),
          Gap(13),
          HomeBannerList(),
          Gap(13),
          BestSellingHeader(),
        ],
      ),
    );
  }
}
