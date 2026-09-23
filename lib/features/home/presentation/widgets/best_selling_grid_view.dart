import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/widgets/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: 163 / 258,
      ),
      itemBuilder: (context, index) {
        return FruitItem();
      },
    );
  }
}
