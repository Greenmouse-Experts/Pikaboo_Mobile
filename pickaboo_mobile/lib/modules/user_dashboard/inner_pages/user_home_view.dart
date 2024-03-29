import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../utilities/utilities.dart';
import '../../../widgets/widgets.dart';

class UserHomeView extends ConsumerWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeOwner = ref.watch(authProvider).user;
    final name = homeOwner?.firstName ?? '';
    final image = homeOwner?.avatar ?? '';
    final notificationCount = ref.watch(authProvider).notificationCount;
    return Scaffold(
      appBar: customAppBar2(context,
          hasElevation: false,
          isUser: true,
          ref: ref,
          hasHamburger: true,
          actions: [
            AppBarIcon(name: name, image: image),
            SizedBox(width: width(context) * 0.04)
          ]),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
            child: CustomBackground(
                child: Padding(
          padding: screenPadding(context),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height(context) * 0.012, horizontal: 16),
                    title: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height(context) * 0.005),
                        child: Text('Welcome 👋',
                            style: regular20(context)
                                .copyWith(color: AppColors.primary))),
                    subtitle: Text(
                        '${homeOwner?.firstName ?? ''} .${(homeOwner?.lastName?.capitalizeFirstLetter ?? '')}.',
                        style: medium13(context)
                            .copyWith(color: Colors.black.withOpacity(0.7))),
                    trailing: Icon(Icons.location_pin,
                        color: AppColors.primary, size: width(context) * 0.06)),
              ),
              SizedBox(height: height(context) * 0.01),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height(context) * 0.012,
                      horizontal: width(context) * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: width(context)),
                      Consumer(builder: (context, ref, child) {
                        final amount = ref.watch(authProvider).wallet ?? '0.00';
                        // final loading = ref.watch(authProvider).isRefreshing;
                        final isVisible = ref.watch(_visibleProvider);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isVisible
                                  ? 'NGN ${amount.formatWithCommas}'
                                  : 'NGN *****',
                              style: medium20(context),
                            ),
                            IconButton(
                                onPressed: () {
                                  ref
                                      .read(_visibleProvider.notifier)
                                      .switchVisibility();
                                },
                                icon: Icon(
                                  !isVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: isMobile(context)
                                      ? width(context) * 0.05
                                      : width(context) * 0.04,
                                ))
                          ],
                        );
                      }),
                      SizedBox(height: height(context) * 0.003),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Get started as ',
                                style: medium13(context).copyWith(
                                    color: Colors.black.withOpacity(0.7))),
                            TextSpan(
                                text: 'Home Resident',
                                style: medium13(context)
                                    .copyWith(color: AppColors.primary)),
                          ],
                        ),
                      ),
                      SizedBox(height: height(context) * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UserRowIcon(
                            onTap: () => context.pushNamed(AppRouter.userFaq),
                            bgColor: AppColors.primary,
                            title: 'FAQs',
                            image: 'faq',
                          ),
                          UserRowIcon(
                            onTap: () => context.pushNamed(AppRouter.fund),
                            bgColor: AppColors.orange,
                            title: 'Fund',
                            image: 'fund',
                          ),
                          UserRowIcon(
                            onTap: () =>
                                context.pushNamed(AppRouter.userhistory),
                            bgColor: AppColors.lightBlue,
                            title: 'Orders',
                            image: 'history',
                          ),
                          NootificationIcon(
                            onTap: () =>
                                context.pushNamed(AppRouter.userNotifications),
                            bgColor: AppColors.orange,
                            notification: notificationCount,
                            title: 'Notification',
                            image: 'notification',
                          )
                        ],
                      ),
                      SizedBox(height: height(context) * 0.01),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height(context) * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ActionCard(
                        onPressed: () => context.pushNamed(
                            AppRouter.requestPickupView,
                            pathParameters: {'isSpecial': 'yes'}),
                        color: AppColors.fadeGreen2,
                        title: 'Request Pick',
                        content: 'Order for waste pickup.',
                        image: 'assets/images/icons/new_request.png',
                        cardHeight: 0.19,
                      ),
                      SizedBox(height: height(context) * 0.0075),
                      ActionCard(
                        onPressed: () => context.pushNamed(
                            AppRouter.marketplace,
                            pathParameters: {'canGoBack': 'yes'}),
                        title: 'Purchase',
                        color: AppColors.fadePurple,
                        content: 'Buy trash cans and waste bins from us.',
                        image: 'assets/images/icons/new_purchase.png',
                        cardHeight: 0.19,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ActionCard(
                        onPressed: () =>
                            context.pushNamed(AppRouter.addressView),
                        title: 'Address',
                        color: AppColors.fadePurple,
                        content: 'View your address',
                        image: 'assets/images/icons/new_location.png',
                        cardHeight: 0.19,
                      ),
                      SizedBox(height: height(context) * 0.0075),
                      ActionCard(
                        onPressed: () =>
                            context.pushNamed(AppRouter.userSupport),
                        title: 'Contact Details',
                        color: AppColors.fadeGreen2,
                        content: 'Contact us directly via our details.',
                        image: 'assets/images/icons/new_contact.png',
                        cardHeight: 0.19,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ))),
      ),
    );
  }
}

final _visibleProvider =
    NotifierProvider<_VisibleNotifier, bool>(_VisibleNotifier.new);

class _VisibleNotifier extends Notifier<bool> {
  @override
  build() {
    return false;
  }

  void switchVisibility() {
    state = !state;
  }
}
