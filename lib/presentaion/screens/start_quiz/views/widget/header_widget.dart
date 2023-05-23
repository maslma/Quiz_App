import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';

class HeaderWidget extends StatelessWidget {
  final int questionCount;
  final int qIndex;

  const HeaderWidget({
    super.key,
    required this.qIndex, required this.questionCount,
  });



  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Question ${qIndex + 1} ',
          style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
              color: AppColor.primary),
          children: [
            TextSpan(
              text: '/ $questionCount',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColor.icon,
                  fontWeight: FontWeight.w400),
            )
          ]),
    );
  }
}
