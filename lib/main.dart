import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/cubit/question_cubit.dart';
import 'package:quiz/presentaion/screens/home/views/home_view.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(377, 813),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => QuestionCubit()..createDatabase()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Quiz App',
              theme: ThemeData(primarySwatch: AppColor.primary as MaterialColor),
              home: const HomeView(),
            ),
          );
        });
  }
}
