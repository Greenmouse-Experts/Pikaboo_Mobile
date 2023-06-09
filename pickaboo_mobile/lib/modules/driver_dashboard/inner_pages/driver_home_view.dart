import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utilities/utilities.dart';
import '../../../widgets/widgets.dart';

class DriverHomeView extends StatelessWidget {
  const DriverHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(context, hasElevation: false),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
            child: CustomBackground2(
                child: Padding(
          padding: screenPadding(context),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const IdIcon(),
            SizedBox(height: adjustedHeight(context) * 0.02),
            Container(
              alignment: Alignment.center,
              width: width(context) * 0.25,
              height: adjustedHeight(context) * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: Text('Jun 2023',
                  style: medium13(context).copyWith(color: Colors.white)),
            ),
            SizedBox(height: adjustedHeight(context) * 0.03),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(width(context) * 0.05),
                      child: const SearchTextField(
                          hintText: 'Search Locations', islocation: true))),
            ),
            SizedBox(height: height(context) * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DriverRowIcon(
                    bgColor: AppColors.lightYellow,
                    title: 'Requests',
                    image: 'request2',
                    onTap: () => context.pushNamed(AppRouter.pickUpRequests)),
                DriverRowIcon(
                    bgColor: AppColors.lightGreen,
                    title: 'Geo Location',
                    image: 'geolocation',
                    onTap: () {}),
                DriverRowIcon(
                    bgColor: AppColors.lightRed,
                    title: 'History',
                    image: 'history1',
                    onTap: () {}),
                DriverRowIcon(
                    bgColor: AppColors.lightIndigo,
                    title: 'FAQs',
                    image: 'faqs',
                    onTap: () => context.pushNamed(AppRouter.faq)),
              ],
            ),
            SizedBox(height: height(context) * 0.02),
            const PickUpCard(),
            SizedBox(height: height(context) * 0.01),
            Text('Stay In Touch', style: medium13(context)),
            SizedBox(height: height(context) * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionCard(
                  onPressed: () {},
                  title: 'Support',
                  content: 'Need help ? Click here to leave a feedback',
                  image: 'assets/images/icons/location.png',
                  cardHeight: 0.18,
                ),
                ActionCard(
                  onPressed: () {},
                  title: 'Contact Details',
                  content: 'Contact us directly via our details.',
                  image: 'assets/images/icons/contact.png',
                  cardHeight: 0.18,
                ),
              ],
            )
          ]),
        ))),
      ),
    );
  }
}
