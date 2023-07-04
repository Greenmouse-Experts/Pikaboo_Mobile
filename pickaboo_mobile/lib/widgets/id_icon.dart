import 'package:flutter/material.dart';

import '../utilities/utilities.dart';
import 'widgets.dart';

class IdIcon extends StatelessWidget {
  final String imageUrl;
  const IdIcon({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: AppAvatar(
        name: 'name',
        imgUrl: imageUrl,
        radius: width(context) * 0.07,
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
