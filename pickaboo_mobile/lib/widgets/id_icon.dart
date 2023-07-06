import 'package:flutter/material.dart';

import '../utilities/utilities.dart';
import 'widgets.dart';

class IdIcon extends StatelessWidget {
  final String imageUrl;
  final String firstName;
  final String lastName;
  const IdIcon(
      {super.key,
      required this.imageUrl,
      required this.firstName,
      required this.lastName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: AppAvatar(
        name: firstName,
        imgUrl: imageUrl,
        radius: width(context) * 0.07,
      ),
      title: Text(
        'Welcome $firstName .${lastName.capitalizeFirstLetter}. ',
        style: semi20(context).copyWith(color: Colors.white),
      ),
      subtitle: Text(
        'Service Personnel',
        style: medium14(context).copyWith(color: Colors.white),
      ),
    );
  }
}
