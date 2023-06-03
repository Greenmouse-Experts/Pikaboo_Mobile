import 'package:flutter/material.dart';

const double baseScreenWidth = 430;

double width(BuildContext context) => MediaQuery.of(context).size.width;

double height(BuildContext context) => MediaQuery.of(context).size.height;

EdgeInsets screenPadding(BuildContext context) => EdgeInsets.symmetric(
    vertical: height(context) * 0.015, horizontal: width(context) * 0.05);

EdgeInsets horizontalPadding(BuildContext context) =>
    EdgeInsets.symmetric(horizontal: width(context) * 0.04);

double calculateTextSize(BuildContext context, double fontSize) {
  final scaleFactor = width(context) / baseScreenWidth;
  final calculatedFontSize = fontSize * scaleFactor;
  return calculatedFontSize;
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 480;
