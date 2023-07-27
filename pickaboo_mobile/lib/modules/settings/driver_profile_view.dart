import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../driver_dashboard/driver_dashboard_vm.dart';

class DriverProfileView extends ConsumerWidget {
  const DriverProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final firstName = user?.firstName ?? '';
    final lastName = user?.lastName ?? '';
    final image = user?.avatar ?? '';
    return Scaffold(
      appBar: customAppBar7(context, hasElevation: false, onLeadingPressed: () {
        ref.read(DriverDashboardViewModel.provider.notifier).updateIndex(0);
      }),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isMobile(context) ? 20 : 40),
                      bottomRight:
                          Radius.circular(isMobile(context) ? 20 : 40))),
              child: Column(
                children: [
                  SizedBox(
                      width: width(context), height: height(context) * 0.02),
                  AppAvatar(
                      name: firstName,
                      imgUrl: image,
                      radius: width(context) * 0.08),
                  SizedBox(height: height(context) * 0.015),
                  Text('$firstName $lastName',
                      style: medium20(context).copyWith(color: Colors.white)),
                  SizedBox(height: height(context) * 0.01),
                  Text('Service Personnel',
                      style: regular15(context).copyWith(color: Colors.white)),
                  SizedBox(height: height(context) * 0.06),
                ],
              ),
            ),
            SizedBox(height: height(context) * 0.02),
            Padding(
              padding: screenPadding(context),
              child: Column(
                children: [
                  ServiceProfileTile(
                      icon: Icons.people,
                      title: 'Account',
                      subTitle: 'Name, Email address, Phone number, Card...',
                      onPressed: () =>
                          context.pushNamed(AppRouter.driverAccountView)),
                  ServiceProfileTile(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      subTitle: 'View all your notifications',
                      onPressed: () =>
                          context.pushNamed(AppRouter.driiverNotifications)),
                  ServiceProfileTile(
                      icon: Icons.support_agent,
                      title: 'Support',
                      subTitle: 'Contact Pikaboo help center',
                      onPressed: () => context.pushNamed(AppRouter.driverFaq)),
                  ServiceProfileTile(
                      icon: Icons.logout,
                      title: 'Logout',
                      subTitle: 'Logout of your account',
                      onPressed: () => AppOverlays.showLogOutDialog(
                          context: context, ref: ref)),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
