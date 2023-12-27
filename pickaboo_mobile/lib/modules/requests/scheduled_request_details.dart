import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class ScheduledRequest extends ConsumerWidget {
  final String cleanupId;
  final bool isActive;
  final String request;
  const ScheduledRequest(
      {super.key,
      required this.isActive,
      required this.request,
      required this.cleanupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void openMap(LatLng coordinates) async {
      var latitude = coordinates.latitude;
      double longitude = coordinates.longitude;
      final url = Platform.isIOS
          ? 'https://maps.apple.com/?q=$latitude,$longitude'
          : 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    final requestDetails =
        DriverScheduleResidenceSchema.fromRawRouterJson(request);
    final name =
        "${(requestDetails.residence?.homeResidence?.firstName) ?? ""} ${(requestDetails.residence?.homeResidence?.lastName) ?? ""}";
    final latitue = requestDetails.residence?.latitude ?? "6.5982159133587555";
    final longitude =
        requestDetails.residence?.longtitude ?? "3.3539029113052066";
    final phone = requestDetails.residence?.homeResidence?.phone ?? "";
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
                    title: 'Area',
                    content: requestDetails.residence?.area1 ?? ""),
                RowTitle(
                    title: 'Address',
                    content:
                        requestDetails.residence?.homeResidence?.address ?? ""),
                RowTitle(
                    title: 'Date Requested',
                    content: requestDetails.createdAt!.formatedDate),
                RowTitle(
                    title: 'Status',
                    content: isActive ? 'Pending' : "Completed"),
                // RowTitle(
                //     title: 'Date Scheduled',
                //     content: requestDetails.residence!.area1)
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
                            context
                                .pushNamed(AppRouter.qrCode, pathParameters: {
                              "id": cleanupId,
                              "isScheduled": "yes"
                            }, extra: {
                              "expectedResidenceId":
                                  requestDetails.residence?.homeResidence?.id?.toString() 
                            });
                          },
                        ),
                      ),
                      SizedBox(width: width(context) * 0.05),
                      Expanded(
                        child: AppButton(
                            text: 'Track',
                            onPressed: () async {
                              // print( "Address is"+requestDetails
                              //     .residence?.homeResidence?.address);
                              final coordinates =
                                  await GeocodingMap.getCoordinatesFromAddress(
                                      requestDetails.residence?.homeResidence
                                              ?.address ??
                                          "Ikeja Lagos");
                              coordinates != null
                                  // ignore: use_build_context_synchronously
                                  ? context.pushNamed(AppRouter.mapView,
                                      pathParameters: {
                                          "latitude":
                                              coordinates.latitude.toString(),
                                          "longitude":
                                              coordinates.longitude.toString(),
                                        })
                                  : openMap(coordinates!);
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
