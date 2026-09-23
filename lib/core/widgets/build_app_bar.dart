import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/widgets/noti_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(
      'الأكثر مبيعًا',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
        fontSize: 19,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w700,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
  );
}
