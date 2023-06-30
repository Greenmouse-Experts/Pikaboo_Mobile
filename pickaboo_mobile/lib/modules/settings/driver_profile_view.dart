import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../driver_dashboard/driver_dashboard_vm.dart';

class DriverProfileView extends ConsumerWidget {
  const DriverProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CircleAvatar(
                          radius: width(context) * 0.08,
                          backgroundColor: AppColors.lightAsh,
                          child: SizedBox(
                            width: width(context) * 0.16,
                            height: width(context) * 0.16,
                            child: Image.asset('assets/images/dummy_icon.png',
                                fit: BoxFit.cover),
                          )),
                      Positioned(
                          top: width(context) * 0.125,
                          child: Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              padding: const EdgeInsets.all(1.5),
                              child: Icon(
                                Icons.camera_alt,
                                size: width(context) * 0.04,
                                color: AppColors.primary,
                              )))
                    ],
                  ),
                  SizedBox(height: height(context) * 0.015),
                  Text('Ibiwari Victor',
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
                      onPressed: () {}),
                  ServiceProfileTile(
                      icon: Icons.location_pin,
                      title: 'My Address',
                      subTitle: 'Name, Email address, Phone number, Card...',
                      onPressed: () {}),
                  ServiceProfileTile(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      subTitle: 'Name, Email address, Phone number, Card...',
                      onPressed: () {}),
                  ServiceProfileTile(
                      icon: Icons.support_agent,
                      title: 'Support',
                      subTitle: 'Contact Pikaboo help center',
                      onPressed: () {}),
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
