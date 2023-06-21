import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../modules/anon_dashboard/anon_dashboard_viewmodel.dart';
import '../modules/driver_dashboard/driver_dashboard_vm.dart';
import '../modules/user_dashboard/user_dashboard_vm.dart';
import '../utilities/utilities.dart';
import 'widgets.dart';

class AnonNavBar extends ConsumerWidget {
  const AnonNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(AnonDashboardViewModel.provider.notifier);
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
              activeIcon: Icon(Icons.login,
                  color: AppColors.primary, size: width(context) * 0.06),
              icon: Icon(Icons.login_outlined, size: width(context) * 0.06),
              label: 'Sign In'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.local_mall,
                  color: AppColors.primary, size: width(context) * 0.06),
              icon:
                  Icon(Icons.local_mall_outlined, size: width(context) * 0.06),
              label: 'Store'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings,
                  color: AppColors.primary, size: width(context) * 0.06),
              icon: Icon(Icons.settings_outlined, size: width(context) * 0.06),
              label: 'About App'),
        ],
        onTap: (i) {
          if (i == 0) {
            context.pushNamed(AppRouter.chooseSignIn);
          } else if (i == 1) {
            AppOverlays.showSignInDialog(context: context);
          } else {
            controller.updateIndex(i);
          }
        },
        currentIndex: ref.watch(AnonDashboardViewModel.provider),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}

class UserNavBar extends ConsumerWidget {
  const UserNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(UserDashboardViewModel.provider.notifier);
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
          ),
        ],
      ),
      height: height(context) * 0.1,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 8.0,
        backgroundColor: Colors.white,
        selectedLabelStyle:
            medium11(context).copyWith(color: AppColors.primary),
        unselectedLabelStyle: medium11(context),
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home_rounded,
                  color: AppColors.primary, size: width(context) * 0.06),
              icon: Icon(Icons.home_outlined, size: width(context) * 0.06),
              label: 'Home'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.local_mall,
                  color: AppColors.primary, size: width(context) * 0.06),
              icon:
                  Icon(Icons.local_mall_outlined, size: width(context) * 0.06),
              label: 'Store'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person,
                  color: AppColors.primary, size: width(context) * 0.06),
              icon: Icon(Icons.person_outlined, size: width(context) * 0.06),
              label: 'Profile'),
          // BottomNavigationBarItem(
          //     activeIcon: Icon(Icons.policy,
          //         color: AppColors.primary, size: width(context) * 0.06),
          //     icon: Icon(Icons.policy_outlined, size: width(context) * 0.06),
          //     label: 'Policy'),
        ],
        onTap: (i) {
          controller.updateIndex(i);
        },
        currentIndex: ref.watch(UserDashboardViewModel.provider),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}

class DriverNavBar extends ConsumerWidget {
  const DriverNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(DriverDashboardViewModel.provider.notifier);
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
          ),
        ],
      ),
      height: height(context) * 0.1,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 8.0,
        backgroundColor: Colors.white,
        selectedLabelStyle:
            medium11(context).copyWith(color: AppColors.primary),
        unselectedLabelStyle: medium11(context),
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home_rounded,
                  color: AppColors.primary, size: width(context) * 0.06),
              icon: Icon(Icons.home_outlined, size: width(context) * 0.06),
              label: 'Home'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person,
                  color: AppColors.primary, size: width(context) * 0.06),
              icon: Icon(Icons.person_outlined, size: width(context) * 0.06),
              label: 'Profile'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.policy,
                  color: AppColors.primary, size: width(context) * 0.06),
              icon: Icon(Icons.policy_outlined, size: width(context) * 0.06),
              label: 'Policy'),
        ],
        onTap: (i) {
          controller.updateIndex(i);
        },
        currentIndex: ref.watch(DriverDashboardViewModel.provider),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
