import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/domain/user_model.dart';
import 'package:quiz/presentaion/screens/home/views/widget/home_body_widget.dart';
import 'package:quiz/presentaion/screens/home/views/widget/home_drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Quiz App',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0.0,
      ),
      drawer: HomeDrawerWidget(
          user: UserModel(
        name: 'Maslma Al Zebda',
        id: '20191403',
        mail: 'maslmaalzebda23@gmail.com',
      )),
      body: const HomeBodyWidget(),
    );
  }
}
