import 'package:flutter/material.dart';

class TermsAndConditionsCheckbox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  const TermsAndConditionsCheckbox({super.key, required this.onChanged});

  @override
  State<TermsAndConditionsCheckbox> createState() =>
      _TermsAndConditionsCheckboxState();
}

class _TermsAndConditionsCheckboxState
    extends State<TermsAndConditionsCheckbox> {
  bool isChecked = false; // Pre-checked based on the design

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: isChecked,
            activeColor: const Color(0xFF0F7542),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
                widget.onChanged(value);
              });
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Tajawal', // Assuming an Arabic font is used
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب، فإنك توافق على ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: 'الشروط\nوالأحكام الخاصة بنا',
                  style: TextStyle(
                    color: Color(0xFF0F7542),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
