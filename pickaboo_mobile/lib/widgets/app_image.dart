import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

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
