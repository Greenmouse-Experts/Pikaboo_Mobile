import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/driver_requests/driver_request_controller.dart';
import '../../data/models/driver_special_request_schema.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class SpecialRequest extends ConsumerWidget {
  final String cleanupId;
  final bool isActive;
  final String request;
  const SpecialRequest(
      {super.key,
      required this.isActive,
      required this.request,
      required this.cleanupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestDetails = DriverSpecialSchema.fromRawJson(request);

    final name =
        "${(requestDetails.homeResidence?.firstName) ?? ""} ${(requestDetails.homeResidence?.lastName) ?? ""}";
    final phone = requestDetails.homeResidence?.phone ?? "";
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
                RowTitle(title: 'Home resident’s name', content: name),
                RowTitle(title: 'Phone Number', content: phone, isPhone: true),
                const RowTitle(
                    title: 'Pickup Type', content: 'Scheduled Request'),
                RowTitle(
                    title: 'Address',
                    content: requestDetails.altAddress ??
                        requestDetails.homeResidence?.address ??
                        ""),
                RowTitle(
                    title: 'Date Requested',
                    content: requestDetails.createdAt!.formatedDate),
                RowTitle(
                    title: 'Status',
                    content: isActive ? 'Pending' : "Completed")
              ],
            ),
          ),
          //   SizedBox(height: height(context) * 0.01),
          //    const Divider(color: AppColors.lightAsh),
          //    SizedBox(height: height(context) * 0.01),
          // Padding(
          //   padding: screenPadding(context),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Pickup details',
          //         style: medium18(context).copyWith(color: AppColors.primary),
          //       ),
          //       SizedBox(height: height(context) * 0.008),
          //       const RowTitle(
          //           title: 'Service Personnel', content: 'Ibiwari Victor'),
          //       const RowTitle(
          //           title: 'Service Personnel Number', content: '08012345678'),
          //       const RowTitle(title: 'Estimated Price', content: '₦ 3,000'),
          //       const RowTitle(title: 'Pickup Date', content: '17/06/2023'),
          //       const RowTitle(title: 'Estimated Time', content: '1hr 10min'),
          //       const RowTitle(title: 'Status', content: 'Pending')
          //     ],
          //   ),
          // ),
          const Spacer(),
          Padding(
            padding: screenPadding(context),
            child: isActive
                ? Row(
                    children: [
                      Expanded(
                          child: AppButton(
                              text: 'Complete',
                              onPressed: () {
                                context.pushNamed(AppRouter.qrCode,
                                    pathParameters: {
                                      "id": cleanupId,
                                      "isScheduled": "no"
                                    });
                              })),
                      SizedBox(width: width(context) * 0.05),
                      Expanded(
                        child: AppButton(
                            text: 'Complete',
                            onPressed: () {
                              ref
                                  .read(driverRequestProvider.notifier)
                                  .completeSpecialRequest(
                                      ref: ref,
                                      context: context,
                                      cleanupId: requestDetails.id.toString());
                            }),
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
