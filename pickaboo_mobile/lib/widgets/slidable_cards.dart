import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utilities/utilities.dart';
import 'app_button.dart';
import 'app_image.dart';

class CardSlide1 extends StatelessWidget {
  const CardSlide1({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(width(context) * 0.025),
        decoration: BoxDecoration(
            gradient: const RadialGradient(
              radius: 0.7,
              colors: [
                AppColors.primaryLight,
                AppColors.primary,
              ],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            const AppImage(
                image: 'assets/images/truck.png',
                imageHeight: 0.18,
                imageWidth: 0.38),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width(context) * 0.45,
                    child: Text('Get instant waste pick up in your area',
                        style: semi18(context).copyWith(color: Colors.white),
                        textAlign: TextAlign.end)),
                SizedBox(height: height(context) * 0.0125),
                AppButton(
                  text: 'LOGIN',
                  onPressed: () {
                    context.pushNamed(AppRouter.chooseSignIn);
                  },
                  buttonWidth: 0.2,
                  buttonHeight: 0.04,
                  buttonColor: Colors.white,
                  textColor: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardSlide2 extends StatelessWidget {
  const CardSlide2({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(width(context) * 0.025),
        decoration: BoxDecoration(
            color: AppColors.purple, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            const AppImage(
                image: 'assets/images/call.png',
                imageHeight: 0.18,
                imageWidth: 0.38),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width(context) * 0.45,
                    child: Text('Activated In-app voice call.',
                        style: semi18(context)
                            .copyWith(color: AppColors.deepPurple),
                        textAlign: TextAlign.end)),
                SizedBox(height: height(context) * 0.0125),
                AppButton(
                  text: 'LOGIN',
                  onPressed: () {
                    context.pushNamed(AppRouter.chooseSignIn);
                  },
                  buttonWidth: 0.2,
                  buttonHeight: 0.04,
                  buttonColor: Colors.white,
                  textColor: AppColors.deepPurple,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardSlide3 extends StatelessWidget {
  const CardSlide3({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(width(context) * 0.025),
        decoration: BoxDecoration(
            color: AppColors.fadeGreen2,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            const AppImage(
                image: 'assets/images/groupeddump.png',
                imageHeight: 0.18,
                imageWidth: 0.38),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppImage(
                    image: 'assets/images/wastesales.png',
                    imageHeight: 0.08,
                    imageWidth: 0.45),
                AppButton(
                  text: 'Go To Shop',
                  onPressed: () {
                    context.pushNamed(AppRouter.marketplace);
                  },
                  buttonWidth: 0.35,
                  buttonHeight: 0.035,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
