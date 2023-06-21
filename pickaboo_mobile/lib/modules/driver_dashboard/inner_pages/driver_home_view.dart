import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utilities/utilities.dart';
import '../../../widgets/widgets.dart';

class DriverHomeView extends StatelessWidget {
  const DriverHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: customAppBar2(context, hasElevation: false, actions: [
        IconButton(
            onPressed: () => context.pushNamed(AppRouter.notifications),
            icon: Icon(
              Icons.notifications,
              size: width(context) * 0.05,
              color: AppColors.gold,
            )),
        SizedBox(width: width(context) * 0.04)
      ]),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
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
                      const IdIcon(),
                      SizedBox(height: adjustedHeight(context) * 0.02),
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
              height: height(context) * 0.6,
              padding: screenPadding(context),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
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
                  SizedBox(height: height(context) * 0.015),
                     Text('Pick Up Alert', style: medium13(context)),
                  SizedBox(height: height(context) * 0.015),
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
        )),
      ),
    );
  }
}
