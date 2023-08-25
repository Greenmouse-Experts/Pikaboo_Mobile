import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../controllers/auth/auth_controller.dart';
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

  static void showErrorSnackBar(
      {required BuildContext context, required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  static void showSuccessSnackBar(
      {required BuildContext context, required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        backgroundColor: AppColors.primary,
      ),
    );
  }

  static void showConfirmDialog(
      {required BuildContext context,
      required WidgetRef ref,
      required VoidCallback confirmAction,
      required String message,
      Color? confirmColor,
      String? confirmText,
      String? cancelText}) {
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
                        message,
                        style: regular16(context),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height(context) * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () => context.pop(),
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.red)),
                                child: Text(
                                  cancelText ?? 'No',
                                  style: medium14(context)
                                      .copyWith(color: Colors.red),
                                )),
                          ),
                          SizedBox(width: width(context) * 0.04),
                          Expanded(
                            child: ElevatedButton(
                                onPressed: confirmAction,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        confirmColor ?? AppColors.primary),
                                child: Text(
                                  confirmText ?? 'Yes',
                                  style: medium14(context)
                                      .copyWith(color: Colors.white),
                                )),
                          ),
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

  static void showLogOutDialog(
      {required BuildContext context, required WidgetRef ref}) {
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
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () => context.pop(),
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: AppColors.primary)),
                                child: Text(
                                  'No',
                                  style: medium14(context)
                                      .copyWith(color: AppColors.primary),
                                )),
                          ),
                          SizedBox(width: width(context) * 0.04),
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(authProvider.notifier)
                                      .logout(context: context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary),
                                child: Text(
                                  'Yes',
                                  style: medium14(context)
                                      .copyWith(color: Colors.white),
                                )),
                          ),
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
      VoidCallback? onPressed,
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
                            if (onPressed == null) {
                              context.pop();
                            } else {
                              onPressed();
                            }
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

  static void loadingDialog({required BuildContext context}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const CircularProgressIndicator.adaptive(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
              ],
            ));
  }

  static void showErrorDialog({required BuildContext context, dynamic error}) {
    showDialog(
        context: context,
        builder: (context) {
          return IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: overlayPadding(context),
                  padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.1,
                      vertical: height(context) * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const CloseButton(),
                      Text('Error', style: semi20(context)),
                      SizedBox(height: height(context) * 0.01),
                      Text(
                        error == null
                            ? 'An unknown error occurred'
                            : error.toString(),
                        style: regular14(context),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height(context) * 0.025),
                      ElevatedButton(
                          onPressed: () {
                            context.pop();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              fixedSize:
                                  Size(width(context), height(context) * 0.06),
                              backgroundColor: AppColors.primary),
                          child: Text(
                            'Continue',
                            style: regular15(context)
                                .copyWith(color: Colors.white),
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

class CloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CloseButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) {
            onPressed!();
          } else {
            context.pop();
          }
        },
        child: Icon(
          Icons.close,
          size: width(context) * 0.06,
          color: Colors.red,
        ),
      ),
    );
  }
}
