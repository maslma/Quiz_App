import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';
import 'package:quiz/presentaion/screens/create_quiz/views/widget/answer_widget.dart';

class QuestionCardWidget extends StatelessWidget {
  const QuestionCardWidget({
    super.key,
    required this.deleteQuestion,
    required this.title,
    required this.answers,
    required this.correctIndex,
  });

  final VoidCallback deleteQuestion;
  final String title;
  final List<String> answers;
  final int correctIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColor.lightBackground),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                title,
                style: TextStyle(fontSize: 22.sp),
              )),
              IconButton(
                onPressed: deleteQuestion,
                icon: const Icon(
                  Icons.delete,
                  color: AppColor.icon,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AnswerWidget(
                answer: answers[index],
                isCorrect: index == correctIndex,
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
            itemCount: answers.length,
          )
        ],
      ),
    );
  }
}
