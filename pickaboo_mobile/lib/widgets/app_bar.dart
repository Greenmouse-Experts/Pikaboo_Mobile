import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utilities/utilities.dart';

AppBar customAppBar(BuildContext context,
        {bool? implyLeading, bool? hasElevation, List<Widget>? actions}) =>
    AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: implyLeading ?? false,
      foregroundColor: Colors.black,
      centerTitle: true,
      elevation: hasElevation == null
          ? 4
          : hasElevation
              ? 4
              : 0,
      leadingWidth: width(context) * 0.4,
      leading: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: width(context) * 0.04),
            Container(
                height: 35,
                width: 35,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Image.asset('assets/images/pickaboo_logo.png')),
            const SizedBox(width: 5),
            Text('PIKABOO',
                style: bold11(context).copyWith(color: Colors.black))
          ],
        ),
      ),
      actions: actions,
    );

AppBar customAppBar2(
  BuildContext context, {
  bool? implyLeading,
  bool? hasElevation,
  List<Widget>? actions,
}) =>
    AppBar(
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: implyLeading ?? false,
        foregroundColor: Colors.black,
        elevation: hasElevation == null
            ? 4
            : hasElevation
                ? 4
                : 0,
        leadingWidth: width(context) * 0.4,
        leading: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: width(context) * 0.04),
              Container(
                  height: 35,
                  width: 35,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Image.asset('assets/images/pickaboo_alt_logo.png')),
              const SizedBox(width: 5),
              Text('PIKABOO',
                  style: bold11(context).copyWith(color: Colors.white))
            ],
          ),
        ),
        actions: actions);

AppBar customAppBar3(BuildContext context,
        {bool? hasElevation,
        Color? bgColor,
        bool? implyLeading,
        List<Widget>? actions}) =>
    AppBar(
      backgroundColor: bgColor ?? Colors.white,
      leading: implyLeading == false
          ? const SizedBox()
          : Padding(
              padding: EdgeInsets.all(width(context) * 0.02),
              child: InkWell(
                onTap: () => context.pop(),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.4),
                          blurRadius: 5,
                        ),
                      ],
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.adaptive.arrow_back_rounded,
                    color: Colors.white,
                    size: width(context) * 0.06,
                  ),
                ),
              ),
            ),
      foregroundColor: Colors.black,
      actions: actions,
      centerTitle: true,
      elevation: hasElevation == null
          ? 4
          : hasElevation
              ? 4
              : 0,
    );

AppBar customAppBar4(BuildContext context,
        {bool? implyLeading, bool? hasElevation}) =>
    AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: implyLeading ?? false,
      foregroundColor: Colors.black,
      centerTitle: true,
      elevation: hasElevation == null
          ? 4
          : hasElevation
              ? 4
              : 0,
      actions: [
        SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: width(context) * 0.04),
              Container(
                  height: 35,
                  width: 35,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Image.asset('assets/images/pickaboo_logo.png')),
              const SizedBox(width: 5),
              Text('PIKABOO',
                  style: bold11(context).copyWith(color: Colors.black)),
              SizedBox(width: width(context) * 0.04)
            ],
          ),
        ),
      ],
    );

AppBar customAppBar5(BuildContext context,
        {VoidCallback? onLeadingPressed,
        bool? hasElevation,
        Color? bgColor,
        List<Widget>? actions}) =>
    AppBar(
      backgroundColor: bgColor ?? Colors.white,
      foregroundColor: Colors.black,
      leading: Padding(
        padding: EdgeInsets.all(width(context) * 0.02),
        child: InkWell(
          onTap: () {
            if (onLeadingPressed == null) {
              context.pop();
            } else {
              onLeadingPressed();
            }
          },
          child: Container(
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 5,
                  ),
                ],
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(50)),
            child: Icon(
              Icons.adaptive.arrow_back_rounded,
              color: Colors.white,
              size: width(context) * 0.06,
            ),
          ),
        ),
      ),
      centerTitle: true,
      elevation: hasElevation == null
          ? 4
          : hasElevation
              ? 4
              : 0,
      actions: actions,
    );

AppBar customAppBar6(
  BuildContext context, {
  VoidCallback? onLeadingPressed,
  bool? hasElevation,
  List<Widget>? actions,
}) =>
    AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        elevation: hasElevation == null
            ? 4
            : hasElevation
                ? 4
                : 0,
        leading: Padding(
          padding: EdgeInsets.all(width(context) * 0.02),
          child: InkWell(
            onTap: () {
              if (onLeadingPressed == null) {
                context.pop();
              } else {
                onLeadingPressed();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 5,
                    ),
                  ],
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.adaptive.arrow_back_rounded,
                color: Colors.white,
                size: width(context) * 0.06,
              ),
            ),
          ),
        ),
        actions: actions);
