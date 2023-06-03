import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double buttonWidth;
  final double buttonHeight;
  const AppButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonWidth = 1,
      this.buttonHeight = 0.05});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height(context) * buttonHeight,
        width: width(context) * buttonWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.primary),
        child: Text(
          text,
          style: semi13(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
