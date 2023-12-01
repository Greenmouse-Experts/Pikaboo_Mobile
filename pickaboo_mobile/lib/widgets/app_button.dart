import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double buttonWidth;
  final double buttonHeight;
  final Color? buttonColor;
  final Color? textColor;
  const AppButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonWidth = 1,
      this.buttonColor,
      this.textColor,
      this.buttonHeight = 0.06});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height(context) * buttonHeight,
        width: width(context) * buttonWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _disableButton()
                ? AppColors.fadeGreen3
                : (buttonColor ?? AppColors.primary)),
        child: Text(
          text,
          style: semi13(context).copyWith(
              color: _disableButton()
                  ? Colors.black26
                  : (textColor ?? Colors.white)),
        ),
      ),
    );
  }

  bool _disableButton() {
    return onPressed == null;
  }
}

class AppButton2 extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double buttonWidth;
  final double buttonHeight;
  final Color? buttonColor;
  final TextStyle? textStyle;
  const AppButton2(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonWidth = 1,
      this.buttonColor,
      this.textStyle,
      this.buttonHeight = 0.06});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height(context) * buttonHeight,
        width: width(context) * buttonWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: _disableButton()
                ? AppColors.fadeGreen3
                : (buttonColor ?? AppColors.primary)),
        child: Text(
          text,
          style: textStyle ??
              semi13(context).copyWith(
                  color: _disableButton() ? Colors.black26 : Colors.white),
        ),
      ),
    );
  }

  bool _disableButton() {
    return onPressed == null;
  }
}

class CustomButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key,
      required this.bgColor,
      required this.textColor,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: height(context) * 0.0075,
            horizontal: width(context) * 0.07),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(3)),
        child: Text(
          text,
          style: medium14(context).copyWith(color: textColor),
        ),
      ),
    );
  }
}
