import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  final double cardHeight;
  final VoidCallback onPressed;
  const ActionCard(
      {super.key,
      required this.title,
      required this.content,
      required this.image,
      required this.cardHeight, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 2.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Container(
          width: width(context) * 0.42,
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
                  style: medium13(context)
                      .copyWith(color: Colors.black.withOpacity(0.7))),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      height: height(context) * (cardHeight / 4.75),
                      padding: EdgeInsets.all(width(context) * 0.01),
                      child: Image.asset(image, fit: BoxFit.cover)))
            ],
          ),
        ),
      ),
    );
  }
}
