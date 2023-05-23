import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/cubit/question_cubit.dart';
import 'package:quiz/cubit/question_state.dart';
import 'package:quiz/domain/question_model.dart';
import 'package:quiz/presentaion/global_widget/global_button.dart';
import 'package:quiz/presentaion/screens/add_question/views/add_question.dart';
import 'package:quiz/presentaion/screens/create_quiz/views/widget/question_card_widget.dart';


class CreateQuiz extends StatelessWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubit,QuestionState>(
        listener: (context,state){},
    builder: (context,state) {
      QuestionCubit cubit = QuestionCubit.get(context);
      cubit.questionsModel=cubit.questions;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Text('Create Quiz',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                  width: double.infinity,
                  child: PrimaryButton(
                    fontSized: 22.sp,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const AddQuestion()));
                    },
                    title: "+  Add new question",
                  ),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    QuestionModel q = cubit.questionsModel![index];
                    return QuestionCardWidget(
                      deleteQuestion: () {
                        QuestionCubit.get(context).showAlertDialog(context,q.id);
                      },
                      title: q.title,
                      answers: q.answers,
                      correctIndex: q.correctIndex,
                    );
                  },
                  separatorBuilder: (context, index) =>  SizedBox(
                    height: 10.h,
                  ),
                  itemCount: cubit.questionsModel?.length??0,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      );
    }
    );
  }
}


