import 'package:flutter/material.dart';

class BannerButton extends StatelessWidget {
  const BannerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),

      child: Center(
        child: Text(
          'تسوق الان',
          style: TextStyle(
            color: const Color(0xFF1B5E37) /* Green1-500 */,
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
