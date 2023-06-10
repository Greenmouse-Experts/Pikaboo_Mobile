import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/anon_dashboard/anon_dashboard_view.dart';
import '../modules/authentication/forgot_password_view.dart';
import '../modules/authentication/login_view.dart';
import '../modules/authentication/reset_status_view.dart';
import '../modules/driver_dashboard/driver_dashboard_view.dart';
import '../modules/faq/faq_view.dart';
import '../modules/fund/fund_status_view.dart';
import '../modules/fund/fund_view.dart';
import '../modules/history/driver_history_view.dart';
import '../modules/history/history_view.dart';
import '../modules/notifications/notifications_view.dart';
import '../modules/onboarding/onboarding_view.dart';
import '../modules/requests/pickup_request_view.dart';
import '../modules/settings/support_view.dart';
import '../modules/shop/market_place_view.dart';
import '../modules/shop/product_view.dart';
import '../modules/user_dashboard/user_dashboard_view.dart';

class AppRouter {
  static const String onboarding = 'onboarding';
  static const String dashboard = 'dashboard';
  static const String login = 'login';
  static const String forgotPassword = 'forgotPassword';
  static const String resetStatus = 'resetStatus';
  static const String userDashboard = 'userDashboard';
  static const String driverDashboard = 'driverDashboard';
  static const String notifications = 'notifications';
  static const String fund = 'fund';
  static const String fundStatus = 'fundStatus';
  static const String pickUpRequests = 'pickuoRequests';
  static const String faq = 'faq';
  static const String history = 'history';
  static const String marketplace = 'marketPlace';
  static const String productPage = 'productPage';
  static const String driverHistory = 'driverHistory';
  static const String support = 'support';
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
        GoRoute(
            name: AppRouter.fund,
            path: AppRouter.fund,
            builder: (context, state) => const FundView()),
        GoRoute(
            name: AppRouter.fundStatus,
            path: AppRouter.fundStatus,
            builder: (context, state) => const FundStatusView()),
        GoRoute(
            name: AppRouter.pickUpRequests,
            path: AppRouter.pickUpRequests,
            builder: (context, state) => const PickUpRequestView()),
        GoRoute(
            name: AppRouter.faq,
            path: AppRouter.faq,
            builder: (context, state) => const FaqView()),
        GoRoute(
            name: AppRouter.history,
            path: AppRouter.history,
            builder: (context, state) => const HistoryView()),
        GoRoute(
            name: AppRouter.marketplace,
            path: AppRouter.marketplace,
            builder: (context, state) => const MarketPlaceView()),
        GoRoute(
            name: AppRouter.productPage,
            path: AppRouter.productPage,
            builder: (context, state) => const ProductView()),
        GoRoute(
            name: AppRouter.driverHistory,
            path: AppRouter.driverHistory,
            builder: (context, state) => const DriverHistoryView()),
        GoRoute(
            name: AppRouter.support,
            path: AppRouter.support,
            builder: (context, state) => const SupportView()),
      ]),
]);

GoRouter get appRouterConfig => _router;
