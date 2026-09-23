import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/theme/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:gap/gap.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 250,
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Gap(20),
                Image.asset(
                  Assets.imagesWatermelonTest,
                ),
                Gap(24),

                ListTile(
                  title: Text(
                    'بطيخ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 1.70,
                    ),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '1500 دينار عراقي ',
                          style: TextStyle(
                            color: const Color(0xFFF4A91F) /* Orange-500 */,
                            fontSize: 13,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyle(
                            color: const Color(0xFFF8C76D) /* Orange-300 */,
                            fontSize: 13,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: const Color(0xFFF4A91F) /* Orange-500 */,
                            fontSize: 13,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            height: 1.70,
                          ),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: TextStyle(
                            color: const Color(0xFFF8C76D) /* Orange-300 */,
                            fontSize: 13,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            height: 1.70,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),

                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
