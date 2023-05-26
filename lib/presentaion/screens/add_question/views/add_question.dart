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


  @override
  void initState() {
    _selectedItem = items[0];
    super.initState();
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
            key: cubit.formKey,
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
                        controller:cubit.questionController,
                      ),
                    ),
                    AnswerField(
                      onSubmitted: (String) {},
                      leading: 'A',
                      hint: 'First Answer',
                      label: 'First Answer',
                      background: Colors.orange,
                      controller: cubit.firstController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnswerField(
                      onSubmitted: (String) {},
                      leading: 'B',
                      hint: 'Second Answer',
                      label: 'Second Answer',
                      background: Colors.green,
                      controller: cubit.secondController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnswerField(
                      onSubmitted: (String) {},
                      leading: 'C',
                      hint: 'Third Answer',
                      label: 'Third Answer',
                      background: Colors.grey,
                      controller: cubit.thirdController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnswerField(
                      textInputAction: TextInputAction.done,
                      onSubmitted: (String) {},
                      leading: 'D',
                      hint: 'Fourth Answer',
                      label: 'Fourth Answer',
                      background: Colors.pink,
                      controller: cubit.fourthController,
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
                          if( cubit.formKey.currentState!=null&& cubit.formKey.currentState!.validate()){
                            await cubit.insertToDataBase(
                              title: cubit.questionController.text,
                              first:  cubit.firstController.text,
                              second:  cubit.secondController.text,
                              third:  cubit.thirdController.text,
                              fourth: cubit. fourthController.text,
                              correct:  cubit.chatToInt( _selectedItem),
                            ).then((value)=> Navigator.of(context).pop());
                            cubit.reset();

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


