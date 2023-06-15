import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class ActionText extends StatelessWidget {
  final VoidCallback action;
  final String leadingText;
  final String actionText;
  const ActionText(
      {super.key,
      required this.action,
      required this.leadingText,
      required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: leadingText,
            style: medium13(context)
                .copyWith(color: Colors.black.withOpacity(0.7)),
            children: <TextSpan>[
              TextSpan(
                text: actionText,
                style: medium13(context).copyWith(color: AppColors.primary),
                recognizer: TapGestureRecognizer()..onTap = action,
              )
            ]),
      ),
    );
  }
}
