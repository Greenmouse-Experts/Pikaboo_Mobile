import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/dashboard/dashboard_view.dart';
import '../modules/onboarding/onboarding_view.dart';

class AppRouter {
  static const onboarding = 'onboarding';
  static const dashboard = 'dashboard';
  static const login = 'login';
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const OnBoardingView(),
      routes: <RouteBase>[
        GoRoute(
            name: AppRouter.onboarding,
            path: AppRouter.onboarding,
            builder: (context, state) => const OnBoardingView()),
        GoRoute(
            name: AppRouter.dashboard,
            path: AppRouter.dashboard,
            builder: (context, state) => const DashboardView()),
      ]),
]);

GoRouter get appRouterConfig => _router;
