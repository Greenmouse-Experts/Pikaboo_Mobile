import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  const ProfileTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            size: width(context) * 0.06,
            color: AppColors.altAsh,
          ),
          title: Text(title, style: medium13(context)),
          subtitle: Text(subTitle,
              style: regular11(context)
                  .copyWith(color: Colors.black.withOpacity(0.4))),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_outlined,
                  size: width(context) * 0.06, color: AppColors.altAsh)),
        ),
        Divider(color: Colors.black.withOpacity(0.15))
      ],
    );
  }
}
