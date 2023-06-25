import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class QuestionIcon extends StatelessWidget {
  const QuestionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: width(context) * 0.07,
        height: width(context) * 0.07,
        decoration: const BoxDecoration(
            color: AppColors.newAsh, shape: BoxShape.circle),
        child: Icon(
          Icons.question_mark_outlined,
          color: AppColors.error,
          size: width(context) * 0.05,
        ),
      ),
    );
  }
}
