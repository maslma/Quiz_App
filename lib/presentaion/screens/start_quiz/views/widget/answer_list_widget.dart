import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/cubit/question_cubit.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';
import 'package:quiz/presentaion/screens/start_quiz/views/widget/answer_item_widget.dart';

class AnswerList extends StatelessWidget {
  final QuestionCubit model;
  final int qIndex;
  final List<String> answers;

  const AnswerList({
    super.key,
    required this.model, required this.qIndex, required this.answers,
  });



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: answers.length,
      itemBuilder: (context, index) {
        String answer = answers[index];
        return Padding(
          padding:  EdgeInsets.only(bottom: 15.h),
          child: InkWell(
            splashColor: AppColor.primary.withOpacity(0.2),
            onTap: () {
              model.setAnswer(qIndex, index);
            },
            child: AnswerItem(
              answer: answer,
              isSelected: model.answersIndex[qIndex] == index,
            ),
          ),
        );
      },
    );
  }
}
