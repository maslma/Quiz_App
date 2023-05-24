import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/cubit/question_cubit.dart';
import 'package:quiz/cubit/question_state.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';
import 'package:quiz/presentaion/screens/start_quiz/views/widget/answer_item_widget.dart';

class AnswerList extends StatelessWidget {
  final int qIndex;
  final List<String> answers;

  const AnswerList({
    super.key,
     required this.qIndex, required this.answers,
  });



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubit,QuestionState>(
      listener: (context,state){},
      builder: (context,state)
      {
        QuestionCubit cubit = QuestionCubit.get(context);
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
                  cubit.setAnswer(qIndex, index);
                  qIndex == cubit.questionsModel!.length - 1
                      ? cubit.setShowResult(true)
                      :const SizedBox();
                },
                child: AnswerItem(
                  answer: answer,
                  isSelected: cubit.answersIndex[qIndex] == index,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
