import 'package:flutter/material.dart';

const double baseScreenWidth = 430;

double width(BuildContext context) => MediaQuery.sizeOf(context).width;

double height(BuildContext context) => MediaQuery.sizeOf(context).height;

double adjustedHeight(BuildContext context) =>
    MediaQuery.sizeOf(context).height - (height(context) * 0.1) - 56;

EdgeInsets screenPadding(BuildContext context) => EdgeInsets.symmetric(
    vertical: height(context) * 0.01, horizontal: width(context) * 0.04);

EdgeInsets overlayPadding(BuildContext context) => EdgeInsets.symmetric(
    vertical: height(context) * 0.01, horizontal: width(context) * 0.1);

EdgeInsets horizontalPadding(BuildContext context) =>
    EdgeInsets.symmetric(horizontal: width(context) * 0.04);

double calculateTextSize(BuildContext context, double fontSize) {
  final scaleFactor = width(context) > 480 && height(context) < 1000
      ? width(context) / (baseScreenWidth * 1.4)
      : width(context) < 290
          ? width(context) / (baseScreenWidth * 0.9)
          : width(context) > 480
              ? width(context) / (baseScreenWidth * 1.2)
              : width(context) / (baseScreenWidth * 0.94);
  final calculatedFontSize = fontSize * scaleFactor;
  return calculatedFontSize;
}

bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < 480;
