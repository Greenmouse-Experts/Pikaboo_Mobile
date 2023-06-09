import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utilities/utilities.dart';

AppBar customAppBar(BuildContext context,
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
      title: SizedBox(
        height: height(context) * 0.075,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 35,
                  width: 35,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Image.asset('assets/images/pickaboo_logo.png')),
              const SizedBox(width: 10),
              Text('PIKABOO',
                  style: bold11(context).copyWith(color: Colors.black))
            ],
          ),
        ),
      ),
    );

AppBar customAppBar2(
  BuildContext context, {
  bool? implyLeading,
  bool? hasElevation,
}) =>
    AppBar(
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: implyLeading ?? false,
      foregroundColor: Colors.black,
      centerTitle: true,
      elevation: hasElevation == null
          ? 4
          : hasElevation
              ? 4
              : 0,
      title: SizedBox(
        height: height(context) * 0.075,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 35,
                  width: 35,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Image.asset('assets/images/pickaboo_alt_logo.png')),
              const SizedBox(width: 10),
              Text('PIKABOO',
                  style: bold11(context).copyWith(color: Colors.white))
            ],
          ),
        ),
      ),
    );

AppBar customAppBar3(BuildContext context,
        {bool? hasElevation, Color? bgColor, bool? implyLeading}) =>
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
      centerTitle: true,
      elevation: hasElevation == null
          ? 4
          : hasElevation
              ? 4
              : 0,
    );
