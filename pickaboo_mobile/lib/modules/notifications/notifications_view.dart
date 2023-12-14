import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../controllers/notifications/notification_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class NotificationView extends ConsumerWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeOwner = ref.watch(authProvider).user;
    final name = homeOwner?.firstName ?? '';
    final image = homeOwner?.avatar ?? '';

    return Scaffold(
      appBar: customAppBar3(context, hasElevation: false, actions: [
        AppBarIcon(name: name, image: image),
        SizedBox(width: width(context) * 0.04)
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder(
            future:
                ref.watch(notificationProvider).getAllNotifications(ref: ref),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const PageLoader();
              } else if (snapshot.hasError) {
                return AppErrorWidget(
                    //snapshot.error!
                    widgetHeight: 0.7,
                    errorType: snapshot.error.runtimeType,
                    error: snapshot.error.toString());
              } else {
                return Consumer(builder: (context, ref, _) {
                  final notifications =
                      ref.watch(notificationProvider).notifications;
                  final unreadNotifications =
                      ref.watch(notificationProvider).unreadNotifications;
                  final readNotifications =
                      ref.watch(notificationProvider).readNotifications;
                  return notifications.isEmpty
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width(context) * 0.04),
                          alignment: Alignment.center,
                          height: height(context) * 0.75,
                          width: width(context),
                          child: Center(
                              child: Text(
                                  'You currently do not have any notifications',
                                  style: medium15(context))),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: screenPadding(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const PageHeader(
                                      title: 'Notifications', hasSearch: false),
                                  unreadNotifications.isEmpty
                                      ? const SizedBox()
                                      : SizedBox(
                                          height: height(context) * 0.02),
                                  unreadNotifications.isEmpty
                                      ? const SizedBox()
                                      : Text('Unread',
                                          style: medium13(context)),
                                ],
                              ),
                            ),
                            ListView.builder(
                                itemCount: unreadNotifications.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, i) => NotificationTile(
                                      notification: unreadNotifications[i],
                                      id: unreadNotifications[i].id!,
                                    ),),
                            Padding(
                              padding: screenPadding(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Earlier', style: medium13(context)),
                                ],
                              ),
                            ),
                            ListView.builder(
                                itemCount: readNotifications.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, i) => NotificationTile(
                                    isUnread: false,
                                    notification: readNotifications[i],
                                    id: readNotifications[i].id!)),
                          ],
                        );
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
