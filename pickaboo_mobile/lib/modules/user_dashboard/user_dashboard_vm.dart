import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/user_profile_view.dart';
import '../shop/market_place_view.dart';
import 'inner_pages/user_home_view.dart';

class UserDashboardViewModel {
  static const pages = [
    UserHomeView(),
    MarketPlaceView(canGoBack: 'user'),
    UserProfileview(isUser: true)
  ];

  final int _index = 0;

  int get index => _index;

  static final provider =
      NotifierProvider<DashBoardPageNotifier, int>(DashBoardPageNotifier.new);
}

class DashBoardPageNotifier extends Notifier<int> {
  @override
  build() {
    return 0;
  }

  updateIndex(int i) {
    state = i;
  }
}

final userMenuProvider = ChangeNotifierProvider<UserMenuNotifier>((ref) {
  return UserMenuNotifier();
});

class UserMenuNotifier extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
