import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utilities/utilities.dart';
import '../../../widgets/widgets.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(context,
          hasElevation: false,
          implyLeading: false,
          actions: [
            CircleAvatar(
              radius: width(context) * 0.04,
              backgroundColor: AppColors.lightAsh,
              child: Image.asset('assets/images/dummy_icon.png',
                  fit: BoxFit.cover),
            ),
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
                    subtitle: Text('Victor .O.',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'NGN 13,000',
                            style: medium20(context),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility_outlined,
                                size: width(context) * 0.05,
                              ))
                        ],
                      ),
                      SizedBox(height: height(context) * 0.003),
                      Text('Get started as Household Owner',
                          style: medium13(context)
                              .copyWith(color: Colors.black.withOpacity(0.7))),
                      SizedBox(height: height(context) * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UserRowIcon(
                            onTap: () => context.pushNamed(AppRouter.faq),
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
                            onTap: () => context.pushNamed(AppRouter.history),
                            bgColor: AppColors.lightBlue,
                            title: 'History',
                            image: 'history',
                          ),
                          UserRowIcon(
                            onTap: () =>
                                context.pushNamed(AppRouter.notifications),
                            bgColor: AppColors.orange,
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
                        onPressed: () {},
                        color: AppColors.fadeGreen2,
                        title: 'Request Pick',
                        content: 'Order for waste pickup.',
                        image: 'assets/images/icons/new_request.png',
                        cardHeight: 0.19,
                      ),
                      SizedBox(height: height(context) * 0.0075),
                      ActionCard(
                        onPressed: () =>
                            context.pushNamed(AppRouter.marketplace),
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
                        onPressed: () {},
                        title: 'Location',
                        color: AppColors.fadePurple,
                        content: 'Set and track your location remotely.',
                        image: 'assets/images/icons/new_location.png',
                        cardHeight: 0.19,
                      ),
                      SizedBox(height: height(context) * 0.0075),
                      ActionCard(
                        onPressed: () => context.pushNamed(AppRouter.support),
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
