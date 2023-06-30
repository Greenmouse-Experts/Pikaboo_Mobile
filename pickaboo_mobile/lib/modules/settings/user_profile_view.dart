import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../driver_dashboard/driver_dashboard_vm.dart';
import '../user_dashboard/user_dashboard_vm.dart';

class UserProfileview extends ConsumerWidget {
  final bool isUser;
  const UserProfileview({super.key, required this.isUser});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeOwner = ref.watch(authProvider).homeOwner;
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
            padding: horizontalPadding(context),
            child: Column(
              children: [
                SizedBox(width: width(context)),
                AppAvatar(
                  imgUrl: homeOwner?.avatar ?? '',
                  radius: width(context) * 0.05,
                  selectedImg: null,
                  name: homeOwner?.ownersName ?? 'h',
                ),
                SizedBox(height: height(context) * 0.01),
                Text(homeOwner?.ownersName ?? "",
                    style: semi20(context).copyWith(color: Colors.white)),
                SizedBox(height: height(context) * 0.01),
                Text('Home Resident',
                    style: regular14(context).copyWith(color: Colors.white)),
                SizedBox(height: height(context) * 0.01),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.06,
                        vertical: width(context) * 0.005),
                    child: Column(
                      children: [
                        ProfileTile(
                            onPressed: () =>
                                context.pushNamed(AppRouter.accountView),
                            icon: Icons.people,
                            title: 'Account',
                            isLast: true,
                            subTitle:
                                'Name, Email address, Phone number, Agreement...'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: isMobile(context)
                        ? height(context) * 0.012
                        : height(context) * 0.025),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.06,
                        vertical: width(context) * 0.002),
                    child: Column(
                      children: [
                        ProfileTile(
                            onPressed: () =>
                                context.pushNamed(AppRouter.addressView),
                            icon: Icons.location_history,
                            title: 'My Address',
                            subTitle: homeOwner?.address ?? ''),
                        ProfileTile(
                            onPressed: () =>
                                context.pushNamed(AppRouter.notifications),
                            icon: Icons.notifications,
                            title: 'Notification',
                            subTitle:
                                'View all and recent notification about your activities'),
                        ProfileTile(
                            onPressed: () =>
                                context.pushNamed(AppRouter.userRequests),
                            icon: Icons.lock,
                            title: 'My Requests',
                            subTitle: 'View all live requests.'),
                        ProfileTile(
                            onPressed: () => context.pushNamed(AppRouter.fund),
                            icon: Icons.wallet,
                            title: 'My Wallet',
                            isLast: true,
                            subTitle:
                                'View and top up available wallet balance.'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: isMobile(context)
                        ? height(context) * 0.012
                        : height(context) * 0.025),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.06,
                        vertical: width(context) * 0.01),
                    child: Column(
                      children: [
                        ProfileTile(
                            onPressed: () => AppOverlays.showLogOutDialog(
                                context: context, ref: ref),
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
