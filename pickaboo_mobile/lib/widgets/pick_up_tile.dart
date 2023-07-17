import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth/auth_controller.dart';
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
          Text('Maclemore Street', style: semi13(context)),
          SizedBox(height: height(context) * 0.0002),
        ],
      ),
      subtitle: Text(request.cleanupRequest?.zone?.name ?? '',
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
  final bool isActive;
  const PickUpCard({super.key, required this.isActive});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountType = ref.watch(authProvider).accountType;
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
                  'Akuku/Ewan',
                  style: semi14(context),
                )
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () => context.pushNamed(
                  accountType == 'Service Personnel'
                      ? AppRouter.driverRequstDetails
                      : AppRouter.userRequstDetails,
                  pathParameters: {'isActive': 'yes'}),
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
