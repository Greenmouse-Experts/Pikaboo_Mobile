import 'package:flutter/material.dart';

const double baseScreenWidth = 430;

double width(BuildContext context) => MediaQuery.of(context).size.width;

double height(BuildContext context) => MediaQuery.of(context).size.height;

double adjustedHeight(BuildContext context) =>
    MediaQuery.of(context).size.height - (height(context) * 0.1) - 56;

EdgeInsets screenPadding(BuildContext context) => EdgeInsets.symmetric(
    vertical: height(context) * 0.01, horizontal: width(context) * 0.04);

EdgeInsets horizontalPadding(BuildContext context) =>
    EdgeInsets.symmetric(horizontal: width(context) * 0.04);

double calculateTextSize(BuildContext context, double fontSize) {
  final scaleFactor = width(context) > 480
      ? width(context) / (baseScreenWidth * 1.2)
      : width(context) / (baseScreenWidth * 0.94);
  final calculatedFontSize = fontSize * scaleFactor;
  return calculatedFontSize;
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 480;
