import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/terms_view.dart';
import '../shop/market_place_view.dart';
import 'inner_pages/anon_home_view.dart';

class AnonDashboardViewModel {
  static const pages = [AnonHomeView(), MarketPlaceView(), TermsView()];

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
