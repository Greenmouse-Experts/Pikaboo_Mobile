import 'package:flutter/material.dart';

import '../utilities/utilities.dart';


AppBar customAppBar(BuildContext context, {bool? implyLeading}) => AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: implyLeading ?? false,
      centerTitle: true,
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
