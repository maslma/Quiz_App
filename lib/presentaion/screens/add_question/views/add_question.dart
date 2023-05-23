import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/cubit/question_cubit.dart';
import 'package:quiz/cubit/question_state.dart';
import 'package:quiz/presentaion/global_widget/global_button.dart';
import 'package:quiz/presentaion/global_widget/text_from_filed.dart';
import 'package:quiz/presentaion/screens/add_question/views/widget/answer_field_widget.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  List<String> items = ['A', 'B', 'C', 'D'];
  late String _selectedItem;
  late AnswerField first;
  late AnswerField second;
  late AnswerField third;
  late AnswerField fourth;

  late TextEditingController questionController;
  late TextEditingController firstController;
  late TextEditingController secondController;
  late TextEditingController thirdController;
  late TextEditingController fourthController;

  GlobalKey<FormState> key=GlobalKey<FormState>();

  @override
  void initState() {
    _selectedItem = items[0];
    questionController = TextEditingController();
    firstController = TextEditingController();
    secondController = TextEditingController();
    thirdController = TextEditingController();
    fourthController = TextEditingController();

    first = AnswerField(

      onSubmitted: (String) {},
      leading: 'A',
      hint: 'First Answer',
      label: 'First Answer',
      background: Colors.orange,
      controller: firstController,
    );
    second = AnswerField(
      onSubmitted: (String) {},
      leading: 'B',
      hint: 'Second Answer',
      label: 'Second Answer',
      background: Colors.green,
      controller: secondController,
    );
    third = AnswerField(
      onSubmitted: (String) {},
      leading: 'C',
      hint: 'Third Answer',
      label: 'Third Answer',
      background: Colors.grey,
      controller: thirdController,
    );
    fourth = AnswerField(
      textInputAction: TextInputAction.done,
      onSubmitted: (String) {},
      leading: 'D',
      hint: 'Fourth Answer',
      label: 'Fourth Answer',
      background: Colors.pink,
      controller: fourthController,
    );
    super.initState();
  }

  @override
  void dispose() {
    questionController.dispose();
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();

    super.dispose();
  }

  int chatToInt(String char) {
    switch (char) {
      case "A":
        {
          return 0;
        }
      case "B":
        {
          return 1;
        }
      case "C":
        {
          return 2;
        }
      case "D":
        {
          return 3;
        }
    }
    return 0;
  }
  void reset(){
    questionController.clear();
    firstController.clear();
    secondController.clear();
    thirdController.clear();
    fourthController.clear();
    _selectedItem = items[0];
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<QuestionCubit,QuestionState>(
      listener: (context,state){},
      builder: (context,state)
      {
        QuestionCubit cubit = QuestionCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title:  Text('Add new question',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: Form(
            key: key,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 20.h, bottom: 10.h),
                      child: CustomTextField(
                        validator: (text){
                          if(text==null||text.isEmpty){
                            return 'question should not be empty';
                          }
                          return null;
                        },
                        onSubmitted: (text) {},
                        hint: 'Enter the question',
                        label: 'Question',
                        isQuestion: true,
                        controller: questionController,
                      ),
                    ),
                    // isPortrait ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        first,
                        const SizedBox(
                          height: 10,
                        ),
                        second,
                        const SizedBox(
                          height: 10,
                        ),
                        third,
                        const SizedBox(
                          height: 10,
                        ),
                        fourth,
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Select the correct answer',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ),
                        SizedBox(
                          width: 70.w,
                          child: DropdownButton(
                              isExpanded: true,
                              value: _selectedItem,
                              items: items
                                  .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(color: Colors.teal,fontSize: 20),
                                ),
                              ))
                                  .toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedItem = newValue ?? '';
                                });
                              }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 70.h,
                      width: double.infinity,
                      child: PrimaryButton(
                        fontSized: 20.sp,
                        padding:  EdgeInsets.only(top: 30.h),
                        onTap: () async {
                          if(key.currentState!=null&&key.currentState!.validate()){
                            await cubit.insertToDataBase(
                              title: questionController.text,
                              first: firstController.text,
                              second: secondController.text,
                              third: thirdController.text,
                              fourth: fourthController.text,
                              correct: chatToInt(_selectedItem),
                            ).then((value)=> Navigator.of(context).pop());
                            reset();

                          }

                        },
                        title: "Add question",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


