import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/cubit/question_cubit.dart';
import 'package:quiz/cubit/question_state.dart';
import 'package:quiz/presentaion/global_widget/global_button.dart';
import 'package:quiz/presentaion/screens/start_quiz/views/start_quiz.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubit, QuestionState>(
        listener: (context, state) {},
        builder: (context, state) {
          QuestionCubit cubit = QuestionCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 80.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/quiz.png',),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: PrimaryButton(
                    fontSized: 20.sp,
                    onTap: () {
                      cubit.answersIndex = List.generate(cubit.questions?.length ?? 0, (index) => null);
                      cubit.setShowResult(false);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const StartQuiz()));
                    },
                    title: "Let\'s Start!",
                  ),
                ),
              ],
            ),
          );
        });
  }
}
