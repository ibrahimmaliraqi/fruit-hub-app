import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xffEEF8ED),
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: const Color(0xFF949D9E) /* Grayscale-400 */,
          fontSize: 16,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w400,
          height: 1.40,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          'أحمد مصطفي',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
            fontSize: 16,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
