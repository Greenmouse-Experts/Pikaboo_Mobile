import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth/auth_controller.dart';
import '../utilities/utilities.dart';

class RequestCard extends ConsumerWidget {
  final bool isUser;
  const RequestCard({super.key, required this.isUser});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountType = ref.watch(authProvider).accountType;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context) * 0.0075),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height(context) * 0.01,
              horizontal: width(context) * 0.02),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: AppColors.error,
                    size: width(context) * 0.06,
                  ),
                  SizedBox(width: width(context) * 0.035),
                  const LocationText(),
                  const Spacer(),
                  InkWell(
                    onTap: () => context.pushNamed(
                        accountType == 'Service Personnel'
                            ? AppRouter.driverRequstDetails
                            : AppRouter.userRequstDetails,
                        pathParameters: {'isActive': 'yes'}),
                    child: Row(
                      children: [
                        Text(
                          'View',
                          style: regular13(context)
                              .copyWith(color: AppColors.primary),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.primary,
                          size: isMobile(context)
                              ? width(context) * 0.04
                              : width(context) * 0.03,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: height(context) * 0.0125),
              Divider(color: Colors.black.withOpacity(0.2)),
              SizedBox(height: height(context) * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isUser
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Ongoing',
                            style: medium12(context)
                                .copyWith(color: AppColors.primary),
                          ),
                        )
                      : Text('Jun 6, 2023',
                          style: regular13(context)
                              .copyWith(color: Colors.black.withOpacity(0.4))),
                  isUser
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              vertical: height(context) * 0.006,
                              horizontal: width(context) * 0.04),
                          decoration: BoxDecoration(
                              color: AppColors.altYellow,
                              borderRadius: BorderRadius.circular(3)),
                          child: Text(
                            'Track',
                            style:
                                medium14(context).copyWith(color: Colors.white),
                          ),
                        )
                      : Text('Completed',
                          style: regular13(context)
                              .copyWith(color: AppColors.success))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewDotLine extends StatelessWidget {
  final bool isExpanded;
  const NewDotLine({super.key, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isExpanded ? null : height(context) * 0.06,
      child: const DottedLine(
        dashGapLength: 2,
        dashLength: 2,
        direction: Axis.vertical,
        dashColor: AppColors.primary,
      ),
    );
  }
}

class LocationText extends StatelessWidget {
  const LocationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Akuku/Ewan', style: semi13(context)),
        SizedBox(height: height(context) * 0.001),
        Text('AKOKO-EDO',
            style: regular13(context)
                .copyWith(color: Colors.black.withOpacity(0.4)))
      ],
    );
  }
}
