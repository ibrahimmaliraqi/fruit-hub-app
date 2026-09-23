import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/home/presentation/widgets/home_banner.dart';

class HomeBannerList extends StatelessWidget {
  const HomeBannerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return HomeBanner();
        },
      ),
    );
  }
}
