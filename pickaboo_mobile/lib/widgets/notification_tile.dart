import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/models/notification_schema.dart';
import '../utilities/utilities.dart';
import 'notification_modal.dart';

class NotificationTile extends StatelessWidget {
  final bool isUnread;
  final NotificationSchema notification;
  final int id;
  const NotificationTile(
      {super.key,
      this.isUnread = true,
      required this.notification,
      required this.id});

  @override
  Widget build(BuildContext context) {
    void showNotificationModal() {
      showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          context: context,
          builder: (context) {
            return NotificationModal(
              id: id,
              isRead: !isUnread,
            );
          });
    }

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
          onPressed: showNotificationModal,
          icon: const Icon(
            Icons.more_horiz_outlined,
            color: Colors.black,
          )),
    );
  }
}

class DriverNotificationIcon extends StatelessWidget {
  final int? notification;
  const DriverNotificationIcon(this.notification, {super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return IconButton(
        onPressed: () => context.pushNamed(AppRouter.driiverNotifications),
        icon: notification == null || notification == 0
            ? Icon(
                Icons.notifications,
                size: width(context) * 0.05,
                color: AppColors.gold,
              )
            : Badge(
                label: Text('$notification'),
                backgroundColor:
                    notification == null ? Colors.transparent : null,
                padding: const EdgeInsets.all(3),
                child: Icon(
                  Icons.notifications,
                  size: width(context) * 0.05,
                  color: AppColors.gold,
                ),
              ));
  }
}
