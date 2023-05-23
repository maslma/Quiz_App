import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onSubmitted,
    required this.hint,
    required this.label,
    this.isQuestion,
    required this.controller,
    this.validator,
    this.textInputAction,
  });

  final Function(String)? onSubmitted;
  final String hint;
  final String label;
  final bool? isQuestion;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction ?? TextInputAction.next,
      validator: validator,
      maxLines: null,
      controller: controller,
      cursorColor:  Colors.teal,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
          hintText: hint,
          label: Text(label),
          hintStyle:  TextStyle(fontSize: 18.sp),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r),borderSide: const BorderSide(color: Colors.teal)),
          prefixIcon: isQuestion ?? false
              ? const Icon(
            Icons.question_mark,
            color:  Colors.teal,
          ) : null),
    );
  }
}