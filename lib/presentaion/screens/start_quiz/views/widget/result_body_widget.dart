import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/presentaion/global_widget/global_button.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';

class ResultBody extends StatelessWidget {
  final String title;
  final String imagePath;
  final String result;
  final String description;

  const ResultBody({
    super.key,
    required this.title,
    required this.imagePath,
    required this.result,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 30.sp,
              color: AppColor.primary,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        Image.asset(
          imagePath,
          height: 250.h,
          width: 300.w,
        ),
        SizedBox(height: 10.h),
        Center(
          child: Text(
            'Your Score : $result',
            style: TextStyle(
                fontSize: 22.sp,
                color: Colors.green,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 80.h,
          width: 280.w,
          child: PrimaryButton(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            fontSized: 20.sp,
            onTap: () {
              Navigator.pop(context);
            },
            title: "Back to home",
          ),
        ),
      ],
    );
  }
}
