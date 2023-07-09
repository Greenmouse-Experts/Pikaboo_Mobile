import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;

import '../utilities/utilities.dart';

class UserRowIcon extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String image;
  final VoidCallback onTap;
  final bool hasBadge;
  const UserRowIcon(
      {super.key,
      required this.bgColor,
      required this.title,
      required this.image,
      this.hasBadge = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: width(context) * 0.12,
            height: width(context) * 0.12,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: EdgeInsets.all(width(context) * 0.04),
              child: Image.asset(
                'assets/images/icons/$image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: height(context) * 0.007),
        Text(
          title,
          style: medium11(context),
        )
      ],
    );
  }
}

class NootificationIcon extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String image;
  final int? notification;
  final VoidCallback onTap;

  const NootificationIcon(
      {super.key,
      required this.bgColor,
      required this.title,
      required this.image,
      required this.onTap,
      this.notification});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: notification == null || notification == 0
              ? Container(
                  width: width(context) * 0.12,
                  height: width(context) * 0.12,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width(context) * 0.04),
                    child: Image.asset(
                      'assets/images/icons/$image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : badge.Badge(
                  badgeStyle:
                      const badge.BadgeStyle(padding: EdgeInsets.all(5)),
                  badgeContent: Text('$notification',
                      style: regular14(context).copyWith(color: Colors.white)),
                  child: Container(
                    width: width(context) * 0.12,
                    height: width(context) * 0.12,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width(context) * 0.04),
                      child: Image.asset(
                        'assets/images/icons/$image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
        ),
        SizedBox(height: height(context) * 0.007),
        Text(
          title,
          style: medium11(context),
        )
      ],
    );
  }
}

class DriverRowIcon extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String image;
  final VoidCallback onTap;
  const DriverRowIcon(
      {super.key,
      required this.bgColor,
      required this.title,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: width(context) * 0.135,
            height: width(context) * 0.135,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(width(context) * 0.0375),
              child: Image.asset(
                'assets/images/icons/$image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: height(context) * 0.007),
        Text(
          title,
          style:
              medium13(context).copyWith(color: Colors.black.withOpacity(0.7)),
        )
      ],
    );
  }
}

class RowTitle extends StatelessWidget {
  final String title;
  final String content;
  const RowTitle({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context) * 0.007),
      child: Row(
        children: [
          Text(
            '$title :',
            style: regular15(context),
          ),
          const SizedBox(width: 5),
          Text(
            content,
            style: regular15(context).copyWith(color: AppColors.primary),
          )
        ],
      ),
    );
  }
}

class RowTitle2 extends StatelessWidget {
  final String title;
  final String content;
  const RowTitle2({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context) * 0.009),
      child: Row(
        children: [
          Text(
            '$title :',
            style: medium15(context)
                .copyWith(color: Colors.black.withOpacity(0.4)),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.centerRight,
            width: width(context) * 0.7,
            child: Text(
              content,
              style: medium16(context),
              textAlign: TextAlign.end,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
