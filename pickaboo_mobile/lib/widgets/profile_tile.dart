import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final bool isLast;
  const ProfileTile(
      {super.key,
      required this.icon,
      required this.title,
      this.isLast = false,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: width(context) * 0.06,
              color: AppColors.altAsh,
            ),
            SizedBox(width: width(context) * 0.04),
            Text(title, style: medium13(context)),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios_outlined,
                    size: width(context) * 0.05, color: AppColors.altAsh)),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: width(context) * 0.1),
          child: SizedBox(
            width: width(context),
            child: Text(subTitle,
                style: regular11(context)
                    .copyWith(color: Colors.black.withOpacity(0.4))),
          ),
        ),
        SizedBox(height: height(context) * 0.005),
        isLast
            ? const SizedBox()
            : Divider(color: Colors.black.withOpacity(0.15))
      ],
    );
  }
}
