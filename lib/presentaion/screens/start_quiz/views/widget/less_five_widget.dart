import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/presentaion/global_widget/global_button.dart';

class LessFive extends StatelessWidget {
  const LessFive({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sorry!',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 26.sp, color: Colors.teal),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'you must add at least 5 questions to start',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: Colors.black54),
        ),
        SizedBox(
          height: 15.h,
        ),
        Center(
          child: SizedBox(
            width: 200.w,
            height: 200.h,
            child: Image.asset(
              'assets/images/faq.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          height: 80.h,
          width: 250.w,
          child: PrimaryButton(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            fontSized: 20.sp,
            onTap: () {
              Navigator.pop(context);
            },
            title: "Back to home",
          ),
        )
      ],
    );
  }
}
