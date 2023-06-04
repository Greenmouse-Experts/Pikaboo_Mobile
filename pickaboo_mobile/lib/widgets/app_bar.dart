import 'package:flutter/material.dart';

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
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Image.asset('assets/images/pickaboo_logo.png')),
          const SizedBox(width: 10),
          Text('PIKABOO', style: bold11(context).copyWith(color: Colors.black))
        ],
      ),
    );

AppBar customAppBar2(BuildContext context,
        {bool? implyLeading, bool? hasElevation}) =>
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
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Image.asset('assets/images/pickaboo_alt_logo.png')),
          const SizedBox(width: 10),
          Text('PIKABOO', style: bold11(context).copyWith(color: Colors.white))
        ],
      ),
    );