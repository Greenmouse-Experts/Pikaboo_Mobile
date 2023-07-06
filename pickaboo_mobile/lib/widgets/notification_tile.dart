import 'package:flutter/material.dart';

import '../data/models/notification_schema.dart';
import '../utilities/utilities.dart';

class NotificationTile extends StatelessWidget {
  final bool isUnread;
  final NotificationSchema notification;
  const NotificationTile(
      {super.key, this.isUnread = true, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isUnread ? AppColors.fadeGreen : Colors.white,
      contentPadding: EdgeInsets.symmetric(
          vertical: height(context) * 0.01, horizontal: 16),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: AppColors.primary,
        ),
        width:
            isMobile(context) ? width(context) * 0.125 : width(context) * 0.07,
        height:
            isMobile(context) ? width(context) * 0.125 : width(context) * 0.07,
        child: Padding(
            padding: EdgeInsets.all(isMobile(context)
                ? width(context) * 0.035
                : width(context) * 0.01),
            child: Image.asset('assets/images/icons/notification.png')),
      ),
      title: Text(
        notification.body ?? '',
        style: medium13(context).copyWith(color: Colors.black.withOpacity(0.4)),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz_outlined,
            color: Colors.black,
          )),
    );
  }
}
