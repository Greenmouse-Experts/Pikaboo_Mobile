import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class UserRowIcon extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String image;
  const UserRowIcon(
      {super.key,
      required this.bgColor,
      required this.title,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width(context) * 0.135,
          height: width(context) * 0.135,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: EdgeInsets.all(width(context) * 0.04),
            child: Image.asset(
              'assets/images/icons/$image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: height(context) * 0.01),
        Text(
          title,
          style: medium11(context),
        )
      ],
    );
  }
}
