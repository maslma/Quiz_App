import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';

class AnswerWidget extends StatelessWidget {
  final String answer;
  final bool isCorrect;

  const AnswerWidget({
    super.key,
    required this.answer,
    required this.isCorrect,
  });



  @override
  Widget build(BuildContext context) {
    Color background = isCorrect ? AppColor.correctColor : AppColor.background;
    Color textColor = isCorrect ? AppColor.background : AppColor.darkBackground;
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(15.r)),
      child: Text(
        answer,
        style: TextStyle(color: textColor, fontSize: 20.sp),
      ),
    );
  }
}
