import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/cubit/question_cubit.dart';
import 'package:quiz/cubit/question_state.dart';
import 'package:quiz/domain/user_model.dart';
import 'package:quiz/presentaion/screens/create_quiz/views/create_quiz.dart';
import 'package:quiz/presentaion/screens/start_quiz/views/start_quiz.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';

class HomeDrawerWidget extends StatelessWidget {
  final UserModel user;
  const HomeDrawerWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubit, QuestionState>(
        listener: (context, state) {},
        builder: (context, state) {
          QuestionCubit cubit = QuestionCubit.get(context);
          return SafeArea(
            child: Drawer(
              elevation: 25,
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColor.background,
                      child: Text(
                        user.name[0],
                        style: TextStyle(fontSize: 30.sp),
                      ),
                    ),
                    accountName: Text(
                      user.name,
                    ),
                    accountEmail: Text(
                      user.mail,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text('Create Quiz'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CreateQuiz()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.quiz),
                    title: const Text('Start Quiz'),
                    onTap: () {
                      cubit.answersIndex = List.generate(
                          cubit.questions?.length ?? 0, (index) => null);
                      cubit.setShowResult(false);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const StartQuiz()));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    leading: const Icon(Icons.exit_to_app_outlined),
                    title: const Text('Exit'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
