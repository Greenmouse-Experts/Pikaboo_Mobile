import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/authentication/forgot_password_view.dart';
import '../modules/authentication/login_view.dart';
import '../modules/authentication/reset_status_view.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/dashboard/inner_pages/user_home_view.dart';
import '../modules/onboarding/onboarding_view.dart';

class AppRouter {
  static const onboarding = 'onboarding';
  static const dashboard = 'dashboard';
  static const login = 'login';
  static const forgotPassword = 'forgotPassword';
  static const resetStatus = 'resetStatus';
  static const userHome = 'userHome';
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
            builder: (context, state) => const DashboardView()),
        GoRoute(
            name: AppRouter.login,
            path: AppRouter.login,
            builder: (context, state) => const LoginView()),
        GoRoute(
            name: AppRouter.forgotPassword,
            path: AppRouter.forgotPassword,
            builder: (context, state) => const ForgotPasswordView()),
        GoRoute(
            name: AppRouter.resetStatus,
            path: AppRouter.resetStatus,
            builder: (context, state) => const ResetStatusView()),
        GoRoute(
            name: AppRouter.userHome,
            path: AppRouter.userHome,
            builder: (context, state) => const UserHomeView()),
      ]),
]);

GoRouter get appRouterConfig => _router;
