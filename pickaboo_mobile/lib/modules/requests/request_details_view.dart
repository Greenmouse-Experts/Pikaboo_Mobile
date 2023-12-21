import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class RequestDetailsView extends ConsumerWidget {
  final bool isActive;

  const RequestDetailsView({super.key, required this.isActive});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: height(context) * 0.01, width: width(context)),
          Text(
            'Request Details',
            style: medium20(context).copyWith(color: AppColors.darkGreen),
          ),
          SizedBox(height: height(context) * 0.01),
          const Divider(color: AppColors.lightAsh),
          SizedBox(height: height(context) * 0.01),
          Padding(
            padding: screenPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Request Details',
                  style: medium18(context).copyWith(color: AppColors.primary),
                ),
                SizedBox(height: height(context) * 0.008),
                const RowTitle(
                    title: 'Home resident’s name', content: 'Victor Osborne'),
                const RowTitle(
                    title: 'Pickup Type', content: 'Special Request'),
                const RowTitle(title: 'Area', content: 'Akoko-Edo'),
                const RowTitle(title: 'Address', content: 'Akuku/Ewan'),
                const RowTitle(title: 'Date Requested', content: '16/06/2023'),
                const RowTitle(title: 'Status', content: 'Pending')
              ],
            ),
          ),
          SizedBox(height: height(context) * 0.01),
          const Divider(color: AppColors.lightAsh),
          SizedBox(height: height(context) * 0.01),
          Padding(
            padding: screenPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pickup details',
                  style: medium18(context).copyWith(color: AppColors.primary),
                ),
                SizedBox(height: height(context) * 0.008),
                const RowTitle(
                    title: 'Service Personnel', content: 'Ibiwari Victor'),
                const RowTitle(
                    title: 'Service Personnel Number', content: '08012345678'),
                const RowTitle(title: 'Estimated Price', content: '₦ 3,000'),
                const RowTitle(title: 'Pickup Date', content: '17/06/2023'),
                const RowTitle(title: 'Estimated Time', content: '1hr 10min'),
                const RowTitle(title: 'Status', content: 'Pending')
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: screenPadding(context),
            child: isActive
                ? Row(
                    children: [
                      Expanded(
                          child: AppButton(
                              text: 'Close', onPressed: () => context.pop())),
                      SizedBox(width: width(context) * 0.05),
                      Expanded(
                        child: AppButton(
                            text: 'Track',
                            onPressed: () => context.pushNamed(
                                    AppRouter.mapView,
                                    pathParameters: {
                                      "latitude": "23",
                                      "longitude": "3"
                                    }),),
                      )
                    ],
                  )
                : AppButton(text: 'Close', onPressed: () => context.pop()),
          )
        ],
      )),
    );
  }
}
