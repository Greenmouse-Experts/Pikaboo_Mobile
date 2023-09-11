import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../data/models/models.dart';
import '../utilities/utilities.dart';
import 'widgets.dart';

class PickupTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final CleanUpSchema request;
  const PickupTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.request});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      onTap: () => context
          .pushNamed(AppRouter.scheduledRequestsAddress, pathParameters: {
        'id': request.cleanupRequest?.id.toString() ?? '',
        'schedule': request.toRawJson()
      }),
      contentPadding: isMobile(context)
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(vertical: height(context) * 0.006),
      leading: Column(
        children: [
          !isFirst ? const DotLine() : SizedBox(height: height(context) * 0.01),
          Container(
            width: width(context) * 0.05,
            height: width(context) * 0.05,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(isMobile(context)
                  ? width(context) * 0.015
                  : width(context) * 0.012),
              child: Container(
                width: width(context) * 0.05,
                height: width(context) * 0.05,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          isLast
              ? SizedBox(
                  height: height(context) * 0.01,
                )
              : const Expanded(
                  child: DotLine(
                  isExpanded: true,
                ))
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Pickup Zone',
              style: medium11(context)
                  .copyWith(color: Colors.black.withOpacity(0.4))),
          SizedBox(height: height(context) * 0.0002),
          Text(request.cleanupRequest?.zone?.name ?? '',
              style: semi13(context)),
          SizedBox(height: height(context) * 0.0002),
        ],
      ),
      // subtitle: Text("Zone:   ${request.cleanupRequest?.zone?.name ?? ''}",
      //     style:
      //         medium11(context).copyWith(color: Colors.black.withOpacity(0.4))),
      trailing: Container(
        width:
            isMobile(context) ? width(context) * 0.06 : width(context) * 0.05,
        height:
            isMobile(context) ? width(context) * 0.06 : width(context) * 0.05,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
        child: Icon(Icons.check,
            size: isMobile(context)
                ? width(context) * 0.05
                : width(context) * 0.04,
            color: Colors.white),
      ),
    );
  }
}

class NewPickUpTile extends StatelessWidget {
  final String address;
  final DateTime date;
  final String price;
  const NewPickUpTile(
      {super.key,
      required this.address,
      required this.date,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height(context) * 0.01),
        Text("Waste Address", style: regular14(context)),
        SizedBox(
            width: width(context) * 0.9,
            child: Text(
              address,
              style: regular12(context).copyWith(color: AppColors.darkAsh),
              maxLines: 2,
            )),
        SizedBox(height: height(context) * 0.01),
        const Divider(color: AppColors.lightAsh),
        SizedBox(height: height(context) * 0.01),
        Text("Date", style: regular14(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(date.formatedDate,
                style: regular12(context).copyWith(color: AppColors.darkAsh)),
            const AppSvgImage(image: "assets/images/icons/calender.svg")
          ],
        ),
        SizedBox(height: height(context) * 0.01),
        const Divider(color: AppColors.lightAsh),
        Container(
          color: AppColors.fadeGreen,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height(context) * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Price", style: regular14(context)),
                Text("NGN $price", style: medium14(context))
              ],
            ),
          ),
        ),
        SizedBox(height: height(context) * 0.02),
      ],
    );
  }
}

class PickupAddressTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final DriverScheduleResidenceSchema request;
  const PickupAddressTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.request});

  @override
  Widget build(BuildContext context) {
    final address = request.residence?.homeResidence?.address ?? '';
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: isMobile(context)
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(vertical: height(context) * 0.006),
      leading: Column(
        children: [
          !isFirst ? const DotLine() : SizedBox(height: height(context) * 0.01),
          Container(
            width: width(context) * 0.05,
            height: width(context) * 0.05,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(isMobile(context)
                  ? width(context) * 0.015
                  : width(context) * 0.012),
              child: Container(
                width: width(context) * 0.05,
                height: width(context) * 0.05,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          isLast
              ? SizedBox(
                  height: height(context) * 0.01,
                )
              : const Expanded(
                  child: DotLine(
                  isExpanded: true,
                ))
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Pickup address',
              style: medium11(context)
                  .copyWith(color: Colors.black.withOpacity(0.4))),
          SizedBox(height: height(context) * 0.0002),
          SizedBox(
              width: width(context) * 0.7,
              child: Text(
                address,
                style: semi13(context),
                maxLines: 2,
              )),
          SizedBox(height: height(context) * 0.0002),
        ],
      ),
      subtitle: Text(request.zone ?? '',
          style:
              medium11(context).copyWith(color: Colors.black.withOpacity(0.4))),
      trailing: Container(
        width:
            isMobile(context) ? width(context) * 0.06 : width(context) * 0.05,
        height:
            isMobile(context) ? width(context) * 0.06 : width(context) * 0.05,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
        child: Icon(Icons.check,
            size: isMobile(context)
                ? width(context) * 0.05
                : width(context) * 0.04,
            color: Colors.white),
      ),
    );
  }
}

class DotLine extends StatelessWidget {
  final bool isExpanded;
  const DotLine({super.key, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isExpanded ? null : height(context) * 0.01,
      child: const DottedLine(
        dashGapLength: 2,
        dashLength: 2,
        direction: Axis.vertical,
        dashColor: AppColors.primary,
      ),
    );
  }
}

class PickUpCard extends ConsumerWidget {
  final DriverSpecialSchema specialRequest;
  const PickUpCard({super.key, required this.specialRequest});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final accountType = ref.watch(authProvider).accountType;
    final isActive = specialRequest.status == "PENDING";
    return Column(
      children: [
        SizedBox(height: height(context) * 0.005),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pickup address',
                    style: medium13(context)
                        .copyWith(color: Colors.black.withOpacity(0.4))),
                SizedBox(height: height(context) * 0.01),
                Text(
                  specialRequest.homeResidence?.address ?? "",
                  style: semi14(context),
                )
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () => context
                  .pushNamed(AppRouter.specialRequestDetails, pathParameters: {
                'isActive': specialRequest.status == 'PENDING' ? 'yes' : 'no',
                "request": specialRequest.toRawJson(),
                "cleanupId": specialRequest.id.toString()
              }),
              child: Row(
                children: [
                  isActive
                      ? CustomButton(
                          bgColor: AppColors.fadeGreen3,
                          textColor: AppColors.primary,
                          onPressed: () {},
                          text: 'Active')
                      : Text('Review', style: regular13(context)),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios_outlined,
                      size: width(context) * 0.04)
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: height(context) * 0.015),
        const Divider(color: AppColors.lightAsh)
      ],
    );
  }
}

class AddressCard extends ConsumerWidget {
  final String cleanUpId;
  final bool isPending;
  final DriverScheduleResidenceSchema address;
  const AddressCard(
      {super.key,
      required this.isPending,
      required this.address,
      required this.cleanUpId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theAddress = address.residence?.homeResidence?.address ?? '';
    return Column(
      children: [
        SizedBox(height: height(context) * 0.005),
        InkWell(
          onTap: () {
            context
                .pushNamed(AppRouter.scheduledRequestDetails, pathParameters: {
              'isActive': isPending ? 'yes' : 'no',
              "request": address.toRawJson(),
              "cleanupId": cleanUpId
            });
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pickup address',
                      style: medium13(context)
                          .copyWith(color: Colors.black.withOpacity(0.4))),
                  SizedBox(height: height(context) * 0.01),
                  SizedBox(
                    width: width(context) * 0.52,
                    child: Text(
                      theAddress,
                      style: semi14(context),
                    ),
                  )
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => context.pushNamed(
                    AppRouter.scheduledRequestDetails,
                    pathParameters: {
                      'isActive': isPending ? 'yes' : 'no',
                      "request": address.toRawJson(),
                      "cleanupId": cleanUpId
                    }),
                child: Row(
                  children: [
                    isPending
                        ? CustomButton(
                            bgColor: AppColors.lightYellow,
                            textColor: AppColors.yellow,
                            onPressed: () {},
                            text: 'Pending')
                        : Text('Review', style: regular13(context)),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward_ios_outlined,
                        size: width(context) * 0.04)
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height(context) * 0.015),
        const Divider(color: AppColors.lightAsh)
      ],
    );
  }
}
