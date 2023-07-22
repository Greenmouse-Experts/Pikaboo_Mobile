import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

const icon = '@mipmap/ic_launcher';
//FirebaseMessaging _firebaseMessaging;
FirebaseMessaging messaging = FirebaseMessaging.instance;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'vam_cards',
  'High Importance Notifications',
  description: 'This channel is used for important notifications.',
  playSound: true,
  importance: Importance.high,
);

initBackgroundNotification() {
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
}

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  // FlutterAppBadger.updateBadgeCount(1);
  // await Firebase.initializeApp();
}

initInfo() async {
  const androidInitialize = AndroidInitializationSettings('pickaboo_logo');
  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          onDidReceiveLocalNotification: (id, title, body, payload) async {});

  // ignore: unused_local_variable
  final InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitialize,
    iOS: initializationSettingsDarwin,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: (notification) async {});

  final messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
  }
}

///initializing local notification plugin
///

Future _onForegroundMessage(RemoteMessage message) async {
  debugPrint('foreground cloud message callback called');

  RemoteNotification? notification = message.notification;

  BigTextStyleInformation bigStyleInfo = BigTextStyleInformation(
    notification!.body.toString(),
    htmlFormatBigText: true,
    contentTitle: notification.title.toString(),
    htmlFormatContentTitle: true,
  );
  FlutterAppBadger.updateBadgeCount(1);
  return flutterLocalNotificationsPlugin.show(
    notification.hashCode,
    notification.title,
    notification.body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        importance: Importance.max,
        channelDescription: channel.description,
        styleInformation: bigStyleInfo,
        priority: Priority.high,
        playSound: true,
        icon: 'pickaboo_logo',
      ),
      iOS: const DarwinNotificationDetails(),
    ),
    payload: message.data['body'],
  );
  // }
}