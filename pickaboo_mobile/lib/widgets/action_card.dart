import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  final double cardHeight;
  final VoidCallback onPressed;
  final Color color;
  const ActionCard(
      {super.key,
      required this.title,
      required this.content,
      required this.image,
      required this.cardHeight, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: color,
        child: Container(
          width: width(context) * 0.43,
          height: height(context) * cardHeight,
          padding: EdgeInsets.all(width(context) * 0.035),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: width(context)),
              Text(title,
                  style: medium13(context).copyWith(color: AppColors.primary)),
              Text(content,
                  style: regular13(context)
                      .copyWith(color: Colors.black.withOpacity(0.7))),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      height: height(context) * (cardHeight / 3.75),
                      padding: EdgeInsets.all(width(context) * 0.01),
                      child: Image.asset(image, fit: BoxFit.cover)))
            ],
          ),
        ),
      ),
    );
  }
}
