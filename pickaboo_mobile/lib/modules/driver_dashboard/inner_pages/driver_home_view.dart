import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../utilities/utilities.dart';
import '../../../widgets/widgets.dart';

class DriverHomeView extends ConsumerWidget {
  const DriverHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final firstName = user?.firstName ?? '';
    final lastName = user?.lastName ?? '';
    final image = user?.avatar ?? '';
    final notificationCount = user?.notificationsCount;

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: customAppBar2(context,
          hasElevation: false,
          ref: ref,
          hasHamburger: true,
          isUser: false,
          actions: [
            IconButton(
                onPressed: () => context.pushNamed(AppRouter.notifications),
                icon: Badge(
                  label: notificationCount == null
                      ? null
                      : Text('$notificationCount'),
                  backgroundColor:
                      notificationCount == null ? Colors.transparent : null,
                  padding: const EdgeInsets.all(3),
                  child: Icon(
                    Icons.notifications,
                    size: width(context) * 0.05,
                    color: AppColors.gold,
                  ),
                )),
            SizedBox(width: width(context) * 0.04)
          ]),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
            child: Container(
          height: height(context) < 700
              ? height(context) * 0.865
              : isMobile(context)
                  ? height(context) * 0.797
                  : height(context) * 0.834,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primary, Colors.white],
              stops: [0.5, 0.5],
            ),
          ),
          child: Column(
            children: [
              Container(
                color: AppColors.primary,
                child: Padding(
                  padding: screenPadding(context),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height(context) * 0.01),
                        IdIcon(
                            imageUrl: image,
                            firstName: firstName,
                            lastName: lastName),
                        height(context) < 700
                            ? const SizedBox()
                            : SizedBox(height: adjustedHeight(context) * 0.02),
                        SizedBox(height: adjustedHeight(context) * 0.015),
                        Row(
                          children: [
                            Text('Joined on:',
                                style: medium13(context).copyWith(
                                    color: Colors.white.withOpacity(0.7))),
                            Text('    Jun 2023',
                                style: medium13(context)
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                        SizedBox(height: adjustedHeight(context) * 0.015),
                        SizedBox(height: height(context) * 0.02),
                      ]),
                ),
              ),
              Container(
                height: height(context) < 700
                    ? height(context) * 0.63925
                    : height(context) * 0.6,
                padding: screenPadding(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isMobile(context) ? 50 : 80),
                        topRight: Radius.circular(isMobile(context) ? 50 : 80)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height(context) * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DriverRowIcon(
                            bgColor: AppColors.lightYellow,
                            title: 'Requests',
                            image: 'request2',
                            onTap: () =>
                                context.pushNamed(AppRouter.pickUpRequests)),
                        DriverRowIcon(
                            bgColor: AppColors.lightGreen,
                            title: 'Geo Location',
                            image: 'geolocation',
                            onTap: () {}),
                        DriverRowIcon(
                            bgColor: AppColors.lightRed,
                            title: 'History',
                            image: 'history1',
                            onTap: () =>
                                context.pushNamed(AppRouter.driverHistory)),
                        DriverRowIcon(
                            bgColor: AppColors.lightIndigo,
                            title: 'FAQs',
                            image: 'faqs',
                            onTap: () => context.pushNamed(AppRouter.faq)),
                      ],
                    ),
                    SizedBox(height: height(context) * 0.02),
                    Align(
                        alignment: Alignment.center,
                        child: Text('Pick Up Alert', style: medium13(context))),
                    SizedBox(height: height(context) * 0.01),
                    const PickUpPreview(),
                    SizedBox(height: height(context) * 0.03),
                    Text('Stay In Touch', style: medium13(context)),
                    SizedBox(height: height(context) * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActionCard(
                          onPressed: () {},
                          title: 'Support',
                          color: AppColors.fadeGreen2,
                          content: 'Need help ? Click here to leave a feedback',
                          image: 'assets/images/icons/new_request.png',
                          cardHeight: 0.18,
                        ),
                        ActionCard(
                          onPressed: () {},
                          color: AppColors.fadePurple,
                          title: 'Contact Details',
                          content: 'Contact us directly via our details.',
                          image: 'assets/images/icons/new_contact.png',
                          cardHeight: 0.18,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
