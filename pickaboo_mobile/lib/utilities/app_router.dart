import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/anon_dashboard/anon_dashboard_view.dart';
import '../modules/authentication/forgot_password_view.dart';
import '../modules/authentication/login_view.dart';
import '../modules/authentication/reset_status_view.dart';
import '../modules/driver_dashboard/driver_dashboard_view.dart';
import '../modules/notifications/notifications_view.dart';
import '../modules/onboarding/onboarding_view.dart';
import '../modules/user_dashboard/user_dashboard_view.dart';

class AppRouter {
  static const onboarding = 'onboarding';
  static const dashboard = 'dashboard';
  static const login = 'login';
  static const forgotPassword = 'forgotPassword';
  static const resetStatus = 'resetStatus';
  static const userDashboard = 'userDashboard';
  static const driverDashboard = 'driverDashboard';
  static const notifications = 'notifications';
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingView();
      },
      routes: <RouteBase>[
        GoRoute(
            name: AppRouter.onboarding,
            path: AppRouter.onboarding,
            builder: (context, state) => const OnBoardingView()),
        GoRoute(
            name: AppRouter.dashboard,
            path: AppRouter.dashboard,
            builder: (context, state) => const AnonDashboardView()),
        GoRoute(
            name: AppRouter.login,
            path: '${AppRouter.login}/:type',
            builder: (context, state) => LoginView(
                  type: state.pathParameters['type']!,
                )),
        GoRoute(
            name: AppRouter.forgotPassword,
            path: AppRouter.forgotPassword,
            builder: (context, state) => const ForgotPasswordView()),
        GoRoute(
            name: AppRouter.resetStatus,
            path: AppRouter.resetStatus,
            builder: (context, state) => const ResetStatusView()),
        GoRoute(
            name: AppRouter.userDashboard,
            path: AppRouter.userDashboard,
            builder: (context, state) => const UserDashboardView()),
        GoRoute(
            name: AppRouter.notifications,
            path: AppRouter.notifications,
            builder: (context, state) => const NotificationView()),
        GoRoute(
            name: AppRouter.driverDashboard,
            path: AppRouter.driverDashboard,
            builder: (context, state) => const DriverDashboardView()),
      ]),
]);

GoRouter get appRouterConfig => _router;
