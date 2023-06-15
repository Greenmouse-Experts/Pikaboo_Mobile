import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double buttonHeight;
  final double buttonWidth;
  const GradientButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonHeight = 0.05,
      this.buttonWidth = 0.4});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height(context) * buttonHeight,
        width: width(context) * buttonWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.orange,
        ),
        child: Text(
          text,
          style: semi13(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
