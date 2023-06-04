import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../modules/dashboard/dashboard_viewmodel.dart';
import '../utilities/utilities.dart';

class AnonNavBar extends ConsumerWidget {
  const AnonNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(DashboardViewModel.provider.notifier);
    return SizedBox(
      height: height(context) * 0.1,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 8.0,
        backgroundColor: Colors.white,
        selectedLabelStyle: medium11(context),
        unselectedLabelStyle: medium11(context),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.login_outlined), label: 'Sign In'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_mall_outlined), label: 'Purchase'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'About App'),
        ],
        onTap: (i) {
          controller.updateIndex(i);
        },
        currentIndex: ref.watch(DashboardViewModel.provider),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
