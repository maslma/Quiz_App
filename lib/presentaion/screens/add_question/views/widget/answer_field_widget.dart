import 'package:flutter/material.dart';
import 'package:quiz/presentaion/global_widget/text_from_filed.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';

class AnswerField extends StatelessWidget {
  const AnswerField({
    super.key,
    required this.onSubmitted,
    required this.leading,
    required this.hint,
    required this.label,
    required this.background,
    required this.controller,
    this.textInputAction,
  });

  final Function(String)? onSubmitted;
  final String leading;
  final String hint;
  final String label;
  final Color background;
  final TextEditingController controller;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: background,
          child: Text(
            leading,
            style: const TextStyle(color: AppColor.background, fontSize: 22),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomTextField(
            validator:(text){
              if(text==null||text.isEmpty){
                return 'answer should not be  empty';
              }
              return null;
            } ,
            textInputAction: textInputAction,
            onSubmitted: onSubmitted,
            hint: hint,
            label: label,
            controller: controller,
          ),
        )
      ],
    );
  }
}
