import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class DescriptiveIcon extends StatelessWidget {
  final IconData icon;
  final String description;
  const DescriptiveIcon(
      {super.key, required this.icon, required this.description});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 12,
      leading: Icon(
        icon,
        size: width(context) * 0.045,
        color: Colors.black.withOpacity(0.4),
      ),
      title: Text(description,
          style: regular14(context)
              .copyWith(color: Colors.black.withOpacity(0.4))),
    );
  }
}
