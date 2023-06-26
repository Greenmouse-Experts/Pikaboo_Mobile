import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/anon_dashboard/anon_dashboard_view.dart';
import '../modules/anon_dashboard/choose_sign_in_view.dart';
import '../modules/authentication/views.dart';
import '../modules/driver_dashboard/driver_dashboard_view.dart';
import '../modules/faq/views.dart';
import '../modules/fund/fund_status_view.dart';
import '../modules/fund/fund_view.dart';
import '../modules/fund/transactions_history_view.dart';
import '../modules/history/driver_history_view.dart';
import '../modules/history/history_view.dart';
import '../modules/notifications/notifications_view.dart';
import '../modules/onboarding/onboarding_view.dart';
import '../modules/requests/views.dart';
import '../modules/settings/views.dart';
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
  static const String chooseSignIn = 'chooseSignIn';
  static const String terms = 'termsandconditions';
  static const String transactionHistory = 'transactionHistory';
  static const String preRequest = 'preRequestView';
  static const String requestPickupView = 'requestPickupView';
  static const String userRequests = 'userRequests';
  static const String requstDetails = 'requestsDetails';
  static const String accountView = 'accountView';
  static const String addressView = 'addressView';
  static const String driverLogin = 'driverLogin';
  static const String feedbackStatus = 'feedbackStatusViiew';
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
            name: AppRouter.chooseSignIn,
            path: AppRouter.chooseSignIn,
            builder: (context, state) => const ChooseSignInView()),
        GoRoute(
            name: AppRouter.login,
            path: '${AppRouter.login}/:type',
            builder: (context, state) => UserLoginView(
                  type: state.pathParameters['type']!,
                )),
        GoRoute(
            name: AppRouter.driverLogin,
            path: AppRouter.driverLogin,
            builder: (context, state) => const DriverLoginView()),
        GoRoute(
            name: AppRouter.forgotPassword,
            path: AppRouter.forgotPassword,
            builder: (context, state) => const ForgotPasswordView()),
        GoRoute(
            name: AppRouter.resetStatus,
            path: '${AppRouter.resetStatus}/:phone',
            builder: (context, state) => ResetStatusView(
                  phone: state.pathParameters['phone']!,
                )),
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
            builder: (context, state) => const MarketPlaceView(
                  canGoBack: 'yes',
                )),
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
        GoRoute(
            name: AppRouter.transactionHistory,
            path: AppRouter.transactionHistory,
            builder: (context, state) => const TransactionsHistoryView()),
        GoRoute(
            name: AppRouter.terms,
            path: '${AppRouter.terms}/:isAnon',
            builder: (context, state) => TermsView(
                  isAnon: state.pathParameters['isAnon']!,
                )),
        GoRoute(
            name: AppRouter.preRequest,
            path: AppRouter.preRequest,
            builder: (context, state) => const PreRequestView()),
        GoRoute(
            name: AppRouter.requestPickupView,
            path: '${AppRouter.requestPickupView}/:isSpecial',
            builder: (context, state) => RequestPickupView(
                  isSpecialRequest: state.pathParameters['isSpecial']! == 'yes',
                )),
        GoRoute(
            name: AppRouter.userRequests,
            path: AppRouter.userRequests,
            builder: (context, state) => const UserRequestsView()),
        GoRoute(
            name: AppRouter.requstDetails,
            path: AppRouter.requstDetails,
            builder: (context, state) => const RequestDetailsView()),
        GoRoute(
            name: AppRouter.addressView,
            path: AppRouter.addressView,
            builder: (context, state) => const AddressView()),
        GoRoute(
            name: AppRouter.accountView,
            path: AppRouter.accountView,
            builder: (context, state) => const AccountView()),
        GoRoute(
            name: AppRouter.feedbackStatus,
            path: AppRouter.feedbackStatus,
            builder: (context, state) => const FeedbackStatusView()),
      ]),
]);

GoRouter get appRouterConfig => _router;
