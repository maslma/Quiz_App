import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/cubit/question_cubit.dart';
import 'package:quiz/cubit/question_state.dart';
import 'package:quiz/domain/question_model.dart';
import 'package:quiz/presentaion/screens/start_quiz/views/widget/answer_list_widget.dart';
import 'package:quiz/presentaion/screens/start_quiz/views/widget/header_widget.dart';
import 'package:quiz/presentaion/screens/start_quiz/views/widget/less_five_widget.dart';
import 'package:quiz/presentaion/screens/start_quiz/views/widget/question_title_widget.dart';
import 'package:quiz/presentaion/screens/start_quiz/views/widget/result_body_widget.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Quiz App',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w500)),
      ),
      body: BlocConsumer<QuestionCubit,QuestionState>(
        listener: (context,state){},
        builder: (context,  state) {
          QuestionCubit cubit = QuestionCubit.get(context);
          cubit.questionsModel = cubit.questionsModel;
          if (cubit.questionsModel == null ||
              cubit.questionsModel!.length < 5) {
            return const LessFive();
          } else if (cubit.showResult) {
            int score = cubit.calculateGrade().round();
            if (score >= 75) {
              return ResultBody(
                title: 'Congratulations!',
                imagePath: 'assets/images/result.jpg',
                result: '${score ~/ 10} / 10',
                description: 'You are superstar!',
              );
            } else if (score >= 50) {
              return ResultBody(
                title: 'Congratulations!',
                imagePath: 'assets/images/result.jpg',
                result: '${score ~/ 10} / 10',
                description: 'Keep up the good work!',
              );
            } else {
              return ResultBody(
                title: 'Oops!',
                imagePath: 'assets/images/fail.png',
                result: '${score ~/ 10} / 10',
                description: 'Sorry, better luck next time!',
              );
            }
          } else {
            return PageView.builder(
              controller:cubit.pageController ,
              itemCount: cubit.questionsModel?.length ?? 0,
              itemBuilder: (BuildContext context, int qIndex) {
                QuestionModel q = cubit.questionsModel![qIndex];
                return Center(
                  child: ListView(
                    primary: true,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(10.h),
                    children: [
                      HeaderWidget(
                        qIndex: qIndex,
                        questionCount: cubit.questionsModel?.length ?? 0,
                      ),
                      SizedBox(height: 20.h),
                      QuestionTitle(questionModel: q),
                      AnswerList(
                        qIndex: qIndex,
                        answers: q.answers,
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
