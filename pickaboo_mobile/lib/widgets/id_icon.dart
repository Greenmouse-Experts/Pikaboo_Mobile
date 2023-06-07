import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class IdIcon extends StatelessWidget {
  const IdIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(),
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
