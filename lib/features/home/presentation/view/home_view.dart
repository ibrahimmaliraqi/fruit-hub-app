import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/home/presentation/widgets/custom_navigation_button.dart';
import 'package:fruit_hub_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestScopeFocus(),
      child: Scaffold(
        extendBody:
            true, // Set to true if you want the body to flow behind the rounded corners
        bottomNavigationBar: CustomBottomNavBar(),
        body: SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
