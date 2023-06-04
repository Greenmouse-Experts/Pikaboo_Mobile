import 'package:flutter/material.dart';
import '../utilities/utilities.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: height(context) * 0.25,
              color: AppColors.primary,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            )
          ],
        ),
        Positioned(child: child)
      ],
    );
  }
}
