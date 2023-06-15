import 'package:flutter/material.dart';

import '../utilities/utilities.dart';
import 'app_image.dart';

class OnBoardingWidget extends StatelessWidget {
  final CustomPainter painter;
  final String header;
  final String content;
  final String image;
  final double imageTop;
  final double imageWidth;
  final double imageHeight;
  const OnBoardingWidget(
      {super.key,
      required this.painter,
      required this.header,
      required this.content,
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
                  content,
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

class InfoWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String content;
  final String image;
  const InfoWidget(
      {super.key,
      required this.color,
      required this.title,
      required this.content,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
          vertical: height(context) * 0.015, horizontal: 16),
      tileColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(title, style: medium16(context)),
      ),
      trailing: AppImage(imageWidth: 0.11, imageHeight: 0.08, image: image),
      subtitle: Text(content,
          style:
              medium12(context).copyWith(color: Colors.black.withOpacity(0.4))),
    );
  }
}

class ChooseSignIn extends StatelessWidget {
  final Color color;
  final String title;
  final String content;
  final String image;
  final VoidCallback onPressed;
  const ChooseSignIn(
      {super.key,
      required this.color,
      required this.onPressed,
      required this.title,
      required this.content,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
          vertical: height(context) * 0.015, horizontal: 16),
      tileColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: onPressed,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_forward_outlined,
            size: width(context) * 0.06,
            color: AppColors.darkGreen,
          ),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(imageWidth: 0.1, imageHeight: 0.035, image: image),
          Text(title, style: medium16(context)),
          const SizedBox(height: 2),
          Text(content,
              style: medium13(context)
                  .copyWith(color: Colors.black.withOpacity(0.4))),
        ],
      ),
    );
  }
}
