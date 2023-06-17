import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pickaboo_mobile/modules/driver_dashboard/driver_dashboard_vm.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../user_dashboard/user_dashboard_vm.dart';

class Profileview extends ConsumerWidget {
  final bool isUser;
  const Profileview({super.key, required this.isUser});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar6(context, hasElevation: false, onLeadingPressed: () {
        if (isUser) {
          ref.read(UserDashboardViewModel.provider.notifier).updateIndex(0);
        } else {
          ref.read(DriverDashboardViewModel.provider.notifier).updateIndex(0);
        }
      }),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
            child: CustomBackground3(
          child: Padding(
            padding: screenPadding(context),
            child: Column(
              children: [
                SizedBox(width: width(context)),
                CircleAvatar(
                    radius: width(context) * 0.065,
                    backgroundColor: AppColors.lightAsh),
                SizedBox(height: height(context) * 0.01),
                Text('Victor Osborne',
                    style: semi20(context).copyWith(color: Colors.white)),
                SizedBox(height: height(context) * 0.01),
                Text('Household Owner',
                    style: regular14(context).copyWith(color: Colors.white)),
                SizedBox(height: height(context) * 0.01),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.06,
                        vertical: width(context) * 0.02),
                    child: const Column(
                      children: [
                        ProfileTile(
                            icon: Icons.location_history,
                            title: 'My Address',
                            subTitle:
                                'Richard Moore estate, Victoria island. Lagos state'),
                        ProfileTile(
                            icon: Icons.people,
                            title: 'Account',
                            isLast: true,
                            subTitle:
                                'Name, Email address, Phone number, Agreement...'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height(context) * 0.01),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.06,
                        vertical: width(context) * 0.02),
                    child: const Column(
                      children: [
                        ProfileTile(
                            icon: Icons.notifications,
                            title: 'Notification',
                            subTitle:
                                'View all and recent notification about your activities'),
                        ProfileTile(
                            icon: Icons.lock,
                            title: 'Passwords',
                            subTitle:
                                'Update and change your password in settings'),
                        ProfileTile(
                            icon: Icons.wallet,
                            title: 'My Wallet',
                            subTitle:
                                'View and top up available wallet balance.'),
                        ProfileTile(
                            icon: Icons.logout,
                            title: 'Logout',
                            isLast: true,
                            subTitle: 'Logout of your account.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
