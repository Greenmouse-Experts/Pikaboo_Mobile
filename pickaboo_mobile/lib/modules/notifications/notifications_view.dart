import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar3(context, hasElevation: false, actions: [
        CircleAvatar(
            radius: width(context) * 0.04,
            backgroundColor: AppColors.lightAsh,
            child:
                Image.asset('assets/images/dummy_icon.png', fit: BoxFit.cover)),
        SizedBox(width: width(context) * 0.04)
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: screenPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PageHeader(title: 'Notifications'),
                  SizedBox(height: height(context) * 0.02),
                  Text('Unread', style: medium13(context)),
                ],
              ),
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => const NotificationTile()),
            Padding(
              padding: screenPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Earlier', style: medium13(context)),
                ],
              ),
            ),
            ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => const NotificationTile(
                      isUnread: false,
                    )),
          ],
        )),
      ),
    );
  }
}
