import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilities/utilities.dart';

class AppSvgImage extends StatelessWidget {
  final double? imageWidth;
  final double? imageHeight;
  final String image;
  const AppSvgImage(
      {super.key, this.imageWidth, this.imageHeight, required this.image});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image, height: imageHeight, width: imageWidth);
  }
}

class AppImage extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;
  final String image;
  const AppImage(
      {super.key,
      required this.imageWidth,
      required this.imageHeight,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(4),
      height: height(context) * imageHeight,
      width: width(context) * imageWidth,
      child: Image.asset(
        image,
        // fit: BoxFit.contain,
      ),
    );
  }
}
