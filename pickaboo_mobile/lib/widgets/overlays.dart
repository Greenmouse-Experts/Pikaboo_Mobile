import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utilities/utilities.dart';
import 'app_button.dart';

class AppOverlays {
  static void showSignInDialog({
    required BuildContext context,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: screenPadding(context),
                  padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.1,
                      vertical: height(context) * 0.04),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        'Proceed to sign in to complete the following action !',
                        style: medium14(context),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height(context) * 0.025),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomButton(
                              bgColor: AppColors.lightYellow2,
                              textColor: AppColors.altYellow,
                              onPressed: () {
                                context.pop();
                              },
                              text: 'Cancel'),
                          SizedBox(width: width(context) * 0.04),
                          CustomButton(
                              bgColor: AppColors.fadeGreen3,
                              textColor: AppColors.primary,
                              onPressed: () {
                                context.pop();
                                context.pushNamed(AppRouter.chooseSignIn);
                              },
                              text: 'Sign in'),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  static void showLogOutDialog({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) {
          return IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: screenPadding(context),
                  padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.1,
                      vertical: height(context) * 0.04),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        'Are you sure you want to logout?',
                        style: regular16(context),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height(context) * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                              onPressed: () => context.pop(),
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: AppColors.primary)),
                              child: Text(
                                'No',
                                style: medium14(context)
                                    .copyWith(color: AppColors.primary),
                              )),
                          SizedBox(width: width(context) * 0.04),
                          ElevatedButton(
                              onPressed: () =>
                                  context.goNamed(AppRouter.dashboard),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary),
                              child: Text(
                                'Yes',
                                style: medium14(context)
                                    .copyWith(color: Colors.white),
                              )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  static void showSuccessDialog(
      {required BuildContext context,
      Widget? contentReplacement,
      required String content}) {
    showDialog(
        context: context,
        builder: (context) {
          return IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: screenPadding(context),
                  padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.1,
                      vertical: height(context) * 0.04),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      // contentReplacement ??
                      Text(
                        content,
                        style: regular14(context),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height(context) * 0.025),
                      CustomButton(
                          bgColor: AppColors.lightYellow2,
                          textColor: AppColors.altYellow,
                          onPressed: () {
                            context.pop();
                          },
                          text: 'Continue'),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
