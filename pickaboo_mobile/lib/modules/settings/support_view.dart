import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class SupportView extends ConsumerWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeOwner = ref.watch(authProvider).homeOwner;
    return Scaffold(
      appBar: customAppBar3(context,
          hasElevation: false,
          bgColor: AppColors.fadeGreen,
          actions: [
            CircleAvatar(
                radius: width(context) * 0.04,
                backgroundColor: AppColors.lightAsh,
                child: Image.asset('assets/images/dummy_icon.png',
                    fit: BoxFit.cover)),
            SizedBox(width: width(context) * 0.04)
          ]),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: height(context) * 0.1,
            color: AppColors.fadeGreen,
            child: Padding(
              padding: screenPadding(context),
              child: Row(
                children: [
                  Image.asset('assets/images/icons/support.png'),
                  SizedBox(width: width(context) * 0.05),
                  PageHeader(
                      title: 'Hello, ${homeOwner?.ownersName ?? ''}',
                      hasSearch: false)
                ],
              ),
            ),
          ),
          Padding(
            padding: screenPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: width(context), height: height(context) * 0.02),
                Text('Self Service', style: medium14(context)),
                SizedBox(width: width(context), height: height(context) * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DriverRowIcon(
                        bgColor: AppColors.lightYellow,
                        title: 'Transactions',
                        image: 'transaction',
                        onTap: () =>
                            context.pushNamed(AppRouter.transactionHistory)),
                    DriverRowIcon(
                        bgColor: AppColors.lightGreen,
                        title: 'Add funds',
                        image: 'addfunds',
                        onTap: () => context.pushNamed(AppRouter.fund)),
                    DriverRowIcon(
                        bgColor: AppColors.lightRed,
                        title: 'Report issue',
                        image: 'issue',
                        onTap: () => context.pushNamed(AppRouter.faq)),
                    DriverRowIcon(
                        bgColor: AppColors.lightIndigo,
                        title: 'FAQs',
                        image: 'faqs',
                        onTap: () => context.pushNamed(AppRouter.faq)),
                  ],
                ),
                SizedBox(width: width(context), height: height(context) * 0.03),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height(context) * 0.015,
                        horizontal: width(context) * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pikaboo Customer Server',
                            style: medium16(context)),
                        SizedBox(
                            height: height(context) * 0.01,
                            width: width(context)),
                        const DescriptiveIcon(
                            icon: Icons.mail_outline_rounded,
                            description: 'customerservice@pikaboo.com'),
                        const DescriptiveIcon(
                            icon: Icons.support_agent_outlined,
                            description: 'help@pikaboo.com'),
                        const DescriptiveIcon(
                            icon: Icons.call_outlined,
                            description: '+234 700 2222 900'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: width(context), height: height(context) * 0.02),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height(context) * 0.015,
                        horizontal: width(context) * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Customer Service Center Address',
                            style: medium16(context)),
                        SizedBox(
                            height: height(context) * 0.01,
                            width: width(context)),
                        const DescriptiveIcon(
                            icon: Icons.location_pin,
                            description:
                                'No 52 Pikaboo Office off Banana island, Lagos. Nigeria.'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
