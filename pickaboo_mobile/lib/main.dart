//import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'controllers/preferences/pref_controller.dart';
import 'controllers/push_notifications/push_notifications_controller.dart';
import 'firebase_options.dart';
import 'utilities/utilities.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Lock the screen to portrait mode only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseMessaging.instance.getInitialMessage();

  await initInfo();
  await initBackgroundNotification();
  // FlutterError.onError = (details) {
  //   log(details.exceptionAsString(), stackTrace: details.stack);
  // };
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(overrides: [
    sharedPreferencesProvider. overrideWithValue(sharedPreferences)
  ], child: const MainApp()));
}

// Future<void> registerNotification() async {
//   // 2. Instantiate Firebase Messaging
//   final messaging = FirebaseMessaging.instance;

//   // 3. On iOS, this helps to take the user permissions
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     badge: true,
//     provisional: false,
//     sound: true,
//   );

//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     print('User granted permission');
//   } else {
//     print('User declined or has not accepted permission');
//   }
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.05);
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            child: child!);
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouterConfig,
    );
  }
}
