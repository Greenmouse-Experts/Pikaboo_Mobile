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
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: height(context) * 0.032,
                  width: width(context) * 0.2,
                  child: Image.asset(
                    'assets/images/icons/sign_in.png',
                    fit: BoxFit.contain,
                  )),
              label: 'Sign In'),
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: height(context) * 0.032,
                  width: width(context) * 0.2,
                  child: Image.asset(
                    'assets/images/icons/purchase.png',
                    fit: BoxFit.contain,
                  )),
              label: 'Purchase'),
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: height(context) * 0.032,
                  width: width(context) * 0.2,
                  child: Image.asset(
                    'assets/images/icons/setting.png',
                    fit: BoxFit.contain,
                  )),
              label: 'About App'),
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
