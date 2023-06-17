import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/profile_view.dart';
import '../settings/terms_view.dart';
import 'inner_pages/driver_home_view.dart';

class DriverDashboardViewModel {
  static const pages = [
    DriverHomeView(),
    Profileview(isUser: false),
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
