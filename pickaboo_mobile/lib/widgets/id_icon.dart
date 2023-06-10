import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class IdIcon extends StatelessWidget {
  const IdIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading:  CircleAvatar(
        radius: width(context) * 0.06,
        child: SizedBox(
          width: width(context) * 0.12,
          height: width(context) * 0.12,
          child: Image.asset('assets/images/dummy_icon.png', fit: BoxFit.cover)),
      ),
      title: Text(
        'Welcome Ibiwari .V. ',
        style: semi20(context).copyWith(color: Colors.white),
      ),
      subtitle: Text(
        'Waste Truck Driver',
        style: medium14(context).copyWith(color: Colors.white),
      ),
    );
  }
}
