import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';

class AnswerItem extends StatelessWidget {
  final String answer;
  final bool? isSelected;

  const AnswerItem({
    super.key,
    required this.answer,
    required this.isSelected,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: isSelected ?? false ? AppColor.primary.withOpacity(0.3) : null,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColor.primary)),
      child: Text(
        answer,
        style:  TextStyle(fontSize: 18.sp),
      ),
    );
  }
}
