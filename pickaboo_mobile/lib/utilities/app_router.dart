import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/anon_dashboard/anon_dashboard_view.dart';
import '../modules/anon_dashboard/choose_sign_in_view.dart';
import '../modules/authentication/views.dart';
import '../modules/driver_dashboard/driver_dashboard_view.dart';
import '../modules/faq/views.dart';
import '../modules/fund/views.dart';
import '../modules/history/viiews.dart';
import '../modules/map/map_view.dart';
import '../modules/notifications/notifications_view.dart';
import '../modules/onboarding/views.dart';
import '../modules/requests/views.dart';
import '../modules/settings/views.dart';
import '../modules/shop/views.dart';
import '../modules/user_dashboard/user_dashboard_view.dart';

class AppRouter {
  static const String splash = 'splash';
  static const String onboarding = '/onboarding';
  static const String dashboard = '/dashboard';
  static const String login = 'login';
  static const String forgotPassword = 'forgotPassword';
  static const String resetStatus = 'resetStatus';
  static const String userDashboard = '/userDashboard';
  static const String driverDashboard = '/driverDashboard';
  static const String userNotifications = 'notifications';
  static const String driiverNotifications = 'drivernotifications';
  static const String fund = 'fund';
  static const String fundStatus = 'fundStatus';
  static const String pickUpRequests = 'pickuoRequests';
  static const String anonfaq = 'anonfaq';
  static const String userFaq = 'userFaq';
  static const String driverFaq = 'driverFaq';
  static const String userhistory = 'history';
  static const String driverhistory1 = 'driverhistory1';
  static const String marketplace = 'marketPlace';
  static const String productPage = 'productPage';
  static const String driverHistory = 'driverHistory';
  static const String userSupport = 'userSupport';
  static const String driverSupport = 'driversSupport';
  static const String chooseSignIn = 'chooseSignIn';
  static const String terms = 'termsandconditions';
  static const String userTerms = 'usertermsandconditions';
  static const String driverTerms = 'driivertermsandconditions';
  static const String userTransactionHistory = 'usertransactionHistory';
  static const String driverTransactionHistory = 'drivertransactionHistory';
  static const String preRequest = 'preRequestView';
  static const String requestPickupView = 'requestPickupView';
  static const String userRequests = 'userRequests';
  static const String userRequstDetails = 'userRequestsDetails';
  static const String driverRequstDetails = 'driverRequestsDetails';
  static const String userAccountView = 'useraccountView';
  static const String driverAccountView = 'driverAccountView';
  static const String addressView = 'addressView';
  static const String driverLogin = 'driverLogin';
  static const String feedbackStatus = 'feedbackStatusViiew';
  static const String mapView = 'mapViiew';
  static const String cartView = 'cartView';
  static const String checkoutView = 'checkoutView';
  static const String oorderDetailsView = 'orderDetailsViews';
  static const String scheduledRequestsAddress = 'scheduledRequestsAddress';
  static const String orderStatusView = 'orderStatusView';
  static const String scheduledRequestDetails = "scheduledRequestsDetails";
  static const String specialRequestDetails = "specialRequestDetails";
  static const String qrCode = "qrCoddeScanView";
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: AppRouter.onboarding,
    name: AppRouter.onboarding,
    builder: (context, state) => const OnBoardingView(),
  ),
  GoRoute(
      name: AppRouter.dashboard,
      path: AppRouter.dashboard,
      builder: (BuildContext context, GoRouterState state) {
        return const AnonDashboardView();
      },
      routes: <RouteBase>[
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
            name: AppRouter.anonfaq,
            path: AppRouter.anonfaq,
            builder: (context, state) => const FaqView()),
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
            name: AppRouter.feedbackStatus,
            path: AppRouter.feedbackStatus,
            builder: (context, state) => const FeedbackStatusView()),
      ]),
  GoRoute(
      name: AppRouter.userDashboard,
      path: AppRouter.userDashboard,
      builder: (context, state) => const UserDashboardView(),
      routes: <RouteBase>[
        GoRoute(
            name: AppRouter.userNotifications,
            path: AppRouter.userNotifications,
            builder: (context, state) => const NotificationView()),
        GoRoute(
            name: AppRouter.fund,
            path: AppRouter.fund,
            builder: (context, state) => const FundView()),
        GoRoute(
            name: AppRouter.fundStatus,
            path: AppRouter.fundStatus,
            builder: (context, state) => const FundStatusView()),
        GoRoute(
            name: AppRouter.userFaq,
            path: AppRouter.userFaq,
            builder: (context, state) => const FaqView()),
        GoRoute(
            name: AppRouter.userhistory,
            path: AppRouter.userhistory,
            builder: (context, state) => const HistoryView()),
        GoRoute(
            name: AppRouter.marketplace,
            path: '${AppRouter.marketplace}/:canGoBack',
            builder: (context, state) => MarketPlaceView(
                  canGoBack: state.pathParameters['canGoBack']!,
                )),
        GoRoute(
            name: AppRouter.productPage,
            path: '${AppRouter.productPage}/:product',
            builder: (context, state) => ProductView(
                  product: state.pathParameters['product']!,
                )),
        GoRoute(
            name: AppRouter.addressView,
            path: AppRouter.addressView,
            builder: (context, state) => const AddressView()),
        GoRoute(
            name: AppRouter.userSupport,
            path: AppRouter.userSupport,
            builder: (context, state) => const SupportView()),
        GoRoute(
            name: AppRouter.userTransactionHistory,
            path: AppRouter.userTransactionHistory,
            builder: (context, state) => const TransactionsHistoryView()),
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
            name: AppRouter.userRequstDetails,
            path: '${AppRouter.userRequstDetails}/:isActive',
            builder: (context, state) => RequestDetailsView(
                  isActive: state.pathParameters['isActive']! == 'yes',
                )),
        GoRoute(
            name: AppRouter.userAccountView,
            path: AppRouter.userAccountView,
            builder: (context, state) => const AccountView()),
        GoRoute(
            name: AppRouter.cartView,
            path: AppRouter.cartView,
            builder: (context, state) => const CartView()),
        GoRoute(
            path: AppRouter.checkoutView,
            name: AppRouter.checkoutView,
            builder: (context, state) => const CheckoutView()),
        GoRoute(
            name: AppRouter.oorderDetailsView,
            path: '${AppRouter.oorderDetailsView}/:id',
            builder: (context, state) => OrderDetailsView(
                  id: state.pathParameters['id']!,
                )),
        GoRoute(
          name: AppRouter.orderStatusView,
          path: AppRouter.orderStatusView,
          builder: (context, state) => const OrderStatusView(),
        )
      ]),
  GoRoute(
      name: AppRouter.driverDashboard,
      path: AppRouter.driverDashboard,
      builder: (context, state) => const DriverDashboardView(),
      routes: <RouteBase>[
        GoRoute(
            name: AppRouter.driiverNotifications,
            path: AppRouter.driiverNotifications,
            builder: (context, state) => const NotificationView()),
        GoRoute(
            name: AppRouter.pickUpRequests,
            path: AppRouter.pickUpRequests,
            builder: (context, state) => const PickUpRequestView()),
        GoRoute(
            name: AppRouter.driverFaq,
            path: AppRouter.driverFaq,
            builder: (context, state) => const FaqView()),
        GoRoute(
            name: AppRouter.driverhistory1,
            path: AppRouter.driverhistory1,
            builder: (context, state) => const HistoryView()),
        GoRoute(
            name: AppRouter.driverHistory,
            path: AppRouter.driverHistory,
            builder: (context, state) => const DriverHistoryView()),
        GoRoute(
            name: AppRouter.driverTransactionHistory,
            path: AppRouter.driverTransactionHistory,
            builder: (context, state) => const TransactionsHistoryView()),
        GoRoute(
            name: AppRouter.driverSupport,
            path: AppRouter.driverSupport,
            builder: (context, state) => const SupportView()),
        GoRoute(
            name: AppRouter.driverTerms,
            path: '${AppRouter.driverTerms}/:isAnon',
            builder: (context, state) => TermsView(
                  isAnon: state.pathParameters['isAnon']!,
                )),
        GoRoute(
            name: AppRouter.driverRequstDetails,
            path: '${AppRouter.driverRequstDetails}/:isActive',
            builder: (context, state) => RequestDetailsView(
                  isActive: state.pathParameters['isActive']! == 'yes',
                )),
        GoRoute(
            name: AppRouter.driverAccountView,
            path: AppRouter.driverAccountView,
            builder: (context, state) => const AccountView()),
        GoRoute(
            name: AppRouter.mapView,
            path: "${AppRouter.mapView}/:latitude/:longitude",
            builder: (context, state) => AppMapView(
                  latitude: state.pathParameters['latitude']!,
                  longitude: state.pathParameters['longitude']!,
                )),
        GoRoute(
            name: AppRouter.scheduledRequestsAddress,
            path: '${AppRouter.scheduledRequestsAddress}/:id/:schedule',
            builder: (context, state) => DriverScheduledDetails(
                  id: state.pathParameters['id']!,
                  schedule: state.pathParameters['schedule']!,
                )),
        GoRoute(
          name: AppRouter.scheduledRequestDetails,
          path:
              "${AppRouter.scheduledRequestDetails}/:isActive/:request/:cleanupId",
          builder: (context, state) => ScheduledRequest(
              isActive: state.pathParameters["isActive"]! == "yes",
              cleanupId: state.pathParameters["cleanupId"]!,
              request: state.pathParameters["request"]!),
        ),
        GoRoute(
          name: AppRouter.specialRequestDetails,
          path:
              "${AppRouter.specialRequestDetails}/:isActive/:request/:cleanupId",
          builder: (context, state) => SpecialRequest(
              isActive: state.pathParameters["isActive"]! == "yes",
              cleanupId: state.pathParameters["cleanupId"]!,
              request: state.pathParameters["request"]!),
        ),
        GoRoute(
          name: AppRouter.qrCode,
          path: "${AppRouter.qrCode}/:id",
          builder: (context, state) => QrCodeScanView(
            cleanupId: state.pathParameters["id"]!,
            isScheduled: state.pathParameters["isScheduled"] == 'yes',
          ),
        ),
      ]),
]);

GoRouter get appRouterConfig => _router;
