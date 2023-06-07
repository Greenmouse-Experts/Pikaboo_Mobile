import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../anon_dashboard/inner_pages/about_view.dart';
import '../anon_dashboard/inner_pages/purchase_view.dart';
import 'inner_pages/driver_home_view.dart';

class DriverDashboardViewModel {
  static const pages = [DriverHomeView(), PurchaseView(), AboutView()];

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
