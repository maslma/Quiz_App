import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/domain/question_model.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';

class QuestionTitle extends StatelessWidget {
  final QuestionModel questionModel;

  const QuestionTitle({
    super.key,
    required this.questionModel,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        questionModel.title,
        style:  TextStyle(
          fontSize: 22.sp,
          color: AppColor.background,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
