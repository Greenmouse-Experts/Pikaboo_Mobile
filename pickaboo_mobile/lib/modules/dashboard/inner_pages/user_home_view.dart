import 'package:flutter/material.dart';

import '../../../utilities/utilities.dart';
import '../../../widgets/widgets.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(context, hasElevation: false, implyLeading: false),
      body: SafeArea(
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
                    padding:
                        EdgeInsets.symmetric(vertical: height(context) * 0.005),
                    child: Text('Welcome 👋',
                        style: regular20(context)
                            .copyWith(color: AppColors.primary))),
                subtitle: Text('Victor .O.',
                    style: medium13(context)
                        .copyWith(color: Colors.black.withOpacity(0.7))),
                trailing: Image.asset('assets/images/icons/house2.png'),
              ),
            ),
            SizedBox(height: height(context) * 0.01),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height(context) * 0.01,
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
                            icon: const Icon(Icons.visibility_outlined))
                      ],
                    ),
                    SizedBox(height: height(context) * 0.005),
                    Text('Get started as Household Owner',
                        style: medium13(context)
                            .copyWith(color: Colors.black.withOpacity(0.7))),
                    SizedBox(height: height(context) * 0.025),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UserRowIcon(
                          bgColor: AppColors.primary,
                          title: 'FAQs',
                          image: 'faq',
                        ),
                        UserRowIcon(
                          bgColor: AppColors.orange,
                          title: 'Fund',
                          image: 'fund',
                        ),
                        UserRowIcon(
                          bgColor: AppColors.lightBlue,
                          title: 'History',
                          image: 'history',
                        ),
                        UserRowIcon(
                          bgColor: AppColors.orange,
                          title: 'Notification',
                          image: 'notification',
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ))),
    );
  }
}
