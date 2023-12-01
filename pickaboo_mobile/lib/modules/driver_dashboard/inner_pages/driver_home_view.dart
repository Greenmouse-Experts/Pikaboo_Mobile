import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo_mobile/data/models/driver_schedule_schema.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../controllers/driver_requests/driver_request_controller.dart';
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
    print('My ');
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: customAppBar2(context,
          hasElevation: false,
          ref: ref,
          hasHamburger: true,
          isUser: false,
          actions: [
            DriverNotificationIcon(notificationCount),
            SizedBox(width: width(context) * 0.04)
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            height: height(context) < 700
                ? height(context) * 0.865
                : isMobile(context)
                    ? height(context) * 0.805
                    : height(context) * 0.834,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primary, Colors.white],
                stops: [0.5, 0.5],
              ),
            ),
            child: FutureBuilder(
                future: ref
                    .watch(driverRequestProvider)
                    .getScheduledRequests(ref: ref),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const PageLoader();
                  } else if (snapshot.hasError) {
                    return AppErrorWidget(
                        //snapshot.error!
                        widgetHeight: 0.7,
                        errorType: snapshot.error.runtimeType,
                        error: snapshot.error.toString());
                  } else {
                    return Column(
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
                                      : SizedBox(
                                          height:
                                              adjustedHeight(context) * 0.02),
                                  SizedBox(
                                      height: adjustedHeight(context) * 0.015),
                                  Row(
                                    children: [
                                      Text('Joined on:',
                                          style: medium13(context).copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.7))),
                                      Text('    Jun 2023',
                                          style: medium13(context)
                                              .copyWith(color: Colors.white)),
                                    ],
                                  ),
                                  SizedBox(
                                      height: adjustedHeight(context) * 0.015),
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
                                  topLeft: Radius.circular(
                                      isMobile(context) ? 50 : 80),
                                  topRight: Radius.circular(
                                      isMobile(context) ? 50 : 80)),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height(context) * 0.05),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  DriverRowIcon(
                                      bgColor: AppColors.lightYellow,
                                      title: 'Requests',
                                      image: 'request2',
                                      onTap: () => context
                                          .pushNamed(AppRouter.pickUpRequests)),
                                  // DriverRowIcon(
                                  //     bgColor: AppColors.lightGreen,
                                  //     title: 'Geo Location',
                                  //     image: 'geolocation',
                                  //     onTap: () {}),
                                  // DriverRowIcon(
                                  //     bgColor: AppColors.lightRed,
                                  //     title: 'History',
                                  //     image: 'history1',
                                  //     onTap: () => context
                                  //         .pushNamed(AppRouter.driverHistory)),
                                  DriverRowIcon(
                                      bgColor: AppColors.lightIndigo,
                                      title: 'FAQs',
                                      image: 'faqs',
                                      onTap: () => context
                                          .pushNamed(AppRouter.driverFaq)),
                                ],
                              ),
                              SizedBox(height: height(context) * 0.03),
                              Text('Pick Up Alerts', style: medium14(context)),
                              SizedBox(height: height(context) * 0.01),
                              const _PickupAlertList(),
                              SizedBox(height: height(context) * 0.03),
                              Text('Stay In Touch', style: medium13(context)),
                              SizedBox(height: height(context) * 0.015),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ActionCard(
                                    onPressed: () =>
                                        context.pushNamed(AppRouter.driverFaq),
                                    title: 'Support',
                                    color: AppColors.fadeGreen2,
                                    content:
                                        'Need help ? Click here to leave a feedback',
                                    image:
                                        'assets/images/icons/new_request.png',
                                    cardHeight: 0.18,
                                  ),
                                  ActionCard(
                                    onPressed: () => context
                                        .pushNamed(AppRouter.userSupport),
                                    color: AppColors.fadePurple,
                                    title: 'Contact Details',
                                    content:
                                        'Contact us directly via our details.',
                                    image:
                                        'assets/images/icons/new_contact.png',
                                    cardHeight: 0.18,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}

class _PickupAlertList extends ConsumerWidget {
  const _PickupAlertList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedules = ref.watch(driverRequestProvider).driverSchedulesHome;
    return SizedBox(
        height: height(context) * 0.11,
        child: schedules.isEmpty
            ? const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                      "You currently have no scheduled requests, you will be notified when yoou receive one"),
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: schedules.length,
                itemBuilder: (context, i) {
                  print(schedules[i].toJson());
                  return PickUpPreview(
                    schedule: schedules[i],
                  );
                }));
  }
}
