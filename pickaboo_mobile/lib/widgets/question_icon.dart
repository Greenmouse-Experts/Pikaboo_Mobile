import 'package:flutter/material.dart';

import '../utilities/utilities.dart';
import 'overlays.dart';

class QuestionIcon extends StatelessWidget {
  const QuestionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppOverlays.showSignInDialog(context: context);
      },
      child: Container(
        width:
            isMobile(context) ? width(context) * 0.09 : width(context) * 0.06,
        height:
            isMobile(context) ? width(context) * 0.09 : width(context) * 0.06,
        decoration: const BoxDecoration(
            color: AppColors.newAsh, shape: BoxShape.circle),
        child: Icon(
          Icons.question_mark_outlined,
          color: AppColors.error,
          size:
              isMobile(context) ? width(context) * 0.06 : width(context) * 0.04,
        ),
      ),
    );
  }
}
