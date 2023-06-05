import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class OnBoardPrompt extends StatelessWidget {
  const OnBoardPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) * 0.1,
      width: width(context) * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkGreen.withOpacity(0.3)),
      ),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/images/icons/onboard_tip.png')],
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: height(context) * 0.01),
          child: Text(
            'Order for Garbage Pickup',
            style: medium14(context),
          ),
        ),
        subtitle: Text(
          'Sign up as a House hold userand order for garbage collectors',
          style: medium11(context)
              .copyWith(color: AppColors.ash.withOpacity(0.85)),
        ),
      ),
    );
  }
}
