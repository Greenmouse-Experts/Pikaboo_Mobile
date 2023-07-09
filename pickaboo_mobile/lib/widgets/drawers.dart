import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../utilities/utilities.dart';
import 'overlays.dart';

class DriverDrawer extends StatelessWidget {
  const DriverDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: width(context) * 0.14,
                          height: height(context) * 0.07,
                          child:
                              Image.asset('assets/images/pickaboo_logo.png')),
                      const SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            'PIKABOO',
                            style: semi30(context)
                                .copyWith(color: AppColors.primary),
                          ),
                          Text(
                            'WASTE MANAGEMENT',
                            style: medium12(context)
                                .copyWith(color: AppColors.primary),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            DrawerTile(
              icon: Icons.account_circle,
              onPressed: () {},
              title: 'Account',
            ),
            DrawerTile(
              icon: Icons.person_pin_circle,
              onPressed: () {},
              title: 'My Address',
            ),
            DrawerTile(
              icon: Icons.notifications,
              onPressed: () {},
              title: 'Notifications',
            ),
            DrawerTile(
              icon: Icons.support_agent,
              onPressed: () {},
              title: 'Support',
            ),
            const Spacer(),
            Consumer(builder: (context, ref, child) {
              return DrawerTile(
                icon: Icons.logout,
                onPressed: () {
                  AppOverlays.showLogOutDialog(context: context, ref: ref);
                },
                title: 'Logout',
              );
            }),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: width(context) * 0.14,
                          height: height(context) * 0.07,
                          child:
                              Image.asset('assets/images/pickaboo_logo.png')),
                      const SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            'PIKABOO',
                            style: semi30(context)
                                .copyWith(color: AppColors.primary),
                          ),
                          Text(
                            'WASTE MANAGEMENT',
                            style: medium12(context)
                                .copyWith(color: AppColors.primary),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            DrawerTile(
              icon: Icons.account_circle,
              onPressed: () {
                context.pop();
                context.pushNamed(AppRouter.userAccountView);
              },
              title: 'Account',
            ),
            DrawerTile(
              icon: Icons.person_pin_circle,
              onPressed: () {
                context.pop();
                context.pushNamed(AppRouter.addressView);
              },
              title: 'My Address',
            ),
            DrawerTile(
              icon: Icons.notifications,
              onPressed: () {
                context.pop();
                context.pushNamed(AppRouter.userNotifications);
              },
              title: 'Notifications',
            ),
            DrawerTile(
              icon: Icons.lock,
              onPressed: () {
                context.pop();
                context.pushNamed(AppRouter.userRequests);
              },
              title: 'Requests',
            ),
            DrawerTile(
              icon: Icons.wallet,
              onPressed: () {
                context.pop();
                context.pushNamed(AppRouter.fund);
              },
              title: 'Wallet',
            ),
            DrawerTile(
              icon: Icons.support_agent,
              onPressed: () {
                context.pop();
                context.pushNamed(AppRouter.userSupport);
              },
              title: 'Support',
            ),
            const Spacer(),
            Consumer(builder: (context, ref, child) {
              return DrawerTile(
                icon: Icons.logout,
                onPressed: () {
                  AppOverlays.showLogOutDialog(context: context, ref: ref);
                },
                title: 'Logout',
              );
            }),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String title;
  const DrawerTile({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(
        icon,
        color: AppColors.primary,
        size: isMobile(context) ? width(context) * 0.06 : width(context) * 0.04,
      ),
      title: Text(
        title,
        style: medium15(context),
      ),
    );
  }
}
