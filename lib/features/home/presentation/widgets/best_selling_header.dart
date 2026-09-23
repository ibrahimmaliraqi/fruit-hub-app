import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/router/app_router.dart';
import 'package:go_router/go_router.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
            fontSize: 16,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () => GoRouter.of(context).push(AppRouter.bestSellingView),
          child: Text(
            'المزيد',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF949D9E) /* Grayscale-400 */,
              fontSize: 13,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              height: 1.60,
            ),
          ),
        ),
      ],
    );
  }
}
