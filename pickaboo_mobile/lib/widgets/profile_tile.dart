import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final bool isLast;
  final VoidCallback onPressed;
  const ProfileTile(
      {super.key,
      required this.icon,
      required this.title,
      this.isLast = false,
      required this.subTitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
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
                  maxLines: 1,
                  style: regular12(context)
                      .copyWith(color: Colors.black.withOpacity(0.4))),
            ),
          ),
          SizedBox(height: height(context) * 0.002),
          isLast
              ? const SizedBox()
              : Divider(color: Colors.black.withOpacity(0.15))
        ],
      ),
    );
  }
}
