import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class OnBoardingWidget extends StatelessWidget {
  final CustomPainter painter;
  final String header;
  final String image;
  final double imageTop;
  final double imageWidth;
  final double imageHeight;
  const OnBoardingWidget(
      {super.key,
      required this.painter,
      required this.header,
      required this.image,
      required this.imageTop,
      required this.imageWidth,
      required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(children: [
        CustomPaint(
          size: Size(width(context), height(context)),
          painter: painter,
        ),
        Positioned(
          top: imageTop,
          child: SizedBox(
            width: width(context),
            child: Center(
              child: Container(
                alignment: Alignment.center,
                height: height(context) * imageHeight,
                width: width(context) * imageWidth,
                child: Image.asset('assets/images/onboarding/onboard$image.png',
                    fit: BoxFit.cover, alignment: Alignment.center),
              ),
            ),
          ),
        ),
        Positioned(
          top: height(context) * 0.6,
          child: Column(
            children: [
              SizedBox(width: width(context)),
              Center(
                child: Text(
                  header,
                  style: semi20(context).copyWith(color: AppColors.darkGreen),
                ),
              ),
              SizedBox(height: height(context) * 0.02),
              SizedBox(
                width: width(context) * 0.8,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eros ligula, rutrum imperdiet',
                  style: medium16(context).copyWith(color: AppColors.ash),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
