import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final EdgeInsets? padding;
  final double? fontSized;

  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.padding,
    this.fontSized,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r))),
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(fontSize: fontSized),
          )),
    );
  }
}
