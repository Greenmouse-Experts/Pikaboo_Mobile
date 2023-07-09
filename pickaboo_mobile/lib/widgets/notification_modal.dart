import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/notifications/notification_controller.dart';
import '../utilities/utilities.dart';

class NotificationModal extends ConsumerWidget {
  final int id;
  final bool isRead;
  const NotificationModal({super.key, required this.id, required this.isRead});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: screenPadding(context),
        child: Column(
          children: [
            SizedBox(width: width(context)),
            Center(
              child: Container(
                height: 7,
                width: width(context) * 0.4,
                decoration: BoxDecoration(
                    color: AppColors.darkAsh,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: height(context) * 0.01),
            isRead
                ? const SizedBox()
                : ListTile(
                    onTap: () {
                      ref
                          .read(notificationProvider.notifier)
                          .readNotification(context: context, id: id, ref: ref);
                    },
                    leading: Icon(
                      Icons.visibility,
                      size: isMobile(context)
                          ? width(context) * 0.06
                          : width(context) * 0.05,
                    ),
                    title: Text(
                      'Mark notification as read',
                      style: medium16(context),
                    ),
                    subtitle: Text(
                      'This notification status will be marked as read',
                      style: regular14(context)
                          .copyWith(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
            ListTile(
              onTap: () {
                ref
                    .read(notificationProvider.notifier)
                    .deleteNotification(context: context, id: id, ref: ref);
              },
              leading: Icon(
                Icons.delete,
                color: Colors.red,
                size: isMobile(context)
                    ? width(context) * 0.06
                    : width(context) * 0.05,
              ),
              title: Text(
                'Delete Notification',
                style: medium16(context),
              ),
              subtitle: Text(
                'This notification will be deleted from your history',
                style: regular14(context)
                    .copyWith(color: Colors.black.withOpacity(0.4)),
              ),
            ),
            SizedBox(height: height(context) * 0.01),
          ],
        ),
      )),
    );
  }
}
