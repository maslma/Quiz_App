import 'package:flutter/material.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';

class AnswerItem extends StatelessWidget {
  final String answer;
  final bool? isSelected;

  const AnswerItem({
    super.key,
    required this.answer,
    required this.isSelected,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: isSelected ?? false ? AppColor.primary.withOpacity(0.3) : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.primary)),
      child: Text(
        answer,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
