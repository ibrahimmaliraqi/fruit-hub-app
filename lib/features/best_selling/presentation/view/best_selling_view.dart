import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/widgets/build_app_bar.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }
}
