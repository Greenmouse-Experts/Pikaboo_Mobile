import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/views.dart';
import 'inner_pages/driver_home_view.dart';

class DriverDashboardViewModel {
  static const pages = [
    DriverHomeView(),
    DriverProfileView(),
    TermsView(isAnon: 'no')
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

final driverMenuProvider = ChangeNotifierProvider<DriverMenuNotifier>((ref) {
  return DriverMenuNotifier();
});

class DriverMenuNotifier extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
