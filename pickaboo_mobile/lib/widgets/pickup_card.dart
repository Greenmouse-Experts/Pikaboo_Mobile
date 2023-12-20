import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/models/driver_schedule_schema.dart';
import '../utilities/utilities.dart';

class PickUpPreview extends StatelessWidget {
  final DriverScheduleSchema schedule;
  const PickUpPreview({super.key, required this.schedule});
  // String getFormattedDate() {
  //   DateTime now = DateTime.now();
  //   String day = now.day.toString().padLeft(2, '0');
  //   String month = now.month.toString().padLeft(2, '0');
  //   String year = now.year.toString();

  //   return '$day/$month/$year';
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.15,
      width: width(context) * 0.8,
      child: InkWell(
        onTap: () =>
            context.pushNamed(AppRouter.scheduledRequestsAddress, extra: {
          'id': schedule.cleanupRequest?.id.toString() ?? '',
          'schedule': schedule.toRawJson()
        }),
        child: Card(
          color: AppColors.lightGreen,
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
              padding: EdgeInsets.all(width(context) * 0.02),
              // width: width(context) * 0.82,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //     width: width(context) * 0.12,
                  //     height: width(context) * 0.12,
                  //     decoration: BoxDecoration(
                  //       color: AppColors.lightGreen,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Icon(
                  //       Icons.delete_outline_outlined,
                  //       color: AppColors.primary,
                  //       size: width(context) * 0.06,
                  //     )),
                  // SizedBox(width: width(context) * 0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          'New Pickup at ${schedule.cleanupRequest?.zone?.name ?? ''}',
                          style: medium15(context)),
                      InkWell(
                        onTap: () => context.pushNamed(
                            AppRouter.scheduledRequestsAddress,
                            pathParameters: {
                              'id':
                                  schedule.cleanupRequest?.id.toString() ?? '',
                              'schedule': schedule.toRawJson()
                            }),
                        child: Row(
                          children: [
                            Text(
                              'See Details',
                              style: medium12(context).copyWith(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                            SizedBox(width: width(context) * 0.01),
                            Text(
                              '||',
                              style: medium12(context).copyWith(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                            SizedBox(width: width(context) * 0.01),
                            Text(
                                'Date:${schedule.scheduledAt?.formatedDate ?? ''}',
                                style: medium12(context).copyWith(
                                    color: Colors.black.withOpacity(0.6))),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     AppButton2(
                  //       text: 'Accept',
                  //       onPressed: () {},
                  //       buttonColor: AppColors.lightGreen,
                  //       buttonWidth: 0.15,
                  //       buttonHeight: isMobile(context) ? 0.025 : 0.022,
                  //       textStyle:
                  //           medium13(context).copyWith(color: AppColors.primary),
                  //     ),
                  //     //  const Spacer(),
                  //     AppButton2(
                  //       text: 'Decline',
                  //       onPressed: () {},
                  //       buttonColor: AppColors.lightYellow2,
                  //       buttonWidth: 0.15,
                  //       buttonHeight: isMobile(context) ? 0.025 : 0.022,
                  //       textStyle:
                  //           medium13(context).copyWith(color: AppColors.yellow),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(width: width(context) * 0.02),
                  InkWell(
                    onTap: () => context.pushNamed(
                        AppRouter.scheduledRequestsAddress,
                        pathParameters: {
                          'id': schedule.cleanupRequest?.id.toString() ?? '',
                          'schedule': schedule.toRawJson()
                        }),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: width(context) * 0.05,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: width(context) * 0.02)
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [

                  //   ],
                  // ),
                ],
              )

              //  ListTile(
              //     contentPadding: EdgeInsets.only(
              //       top: height(context) * 0.01,
              //       left: 16,
              //       right: 4,
              //       bottom: height(context) * 0.01,
              //     ),
              //     leading: Container(
              //         width: width(context) * 0.12,
              //         height: width(context) * 0.12,
              //         decoration: BoxDecoration(
              //           color: AppColors.lightGreen,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Icon(
              //           Icons.delete_outline_outlined,
              //           color: AppColors.primary,
              //           size: width(context) * 0.06,
              //         )),
              //     title: Text('New Pickup at OJOTA', style: medium15(context)),
              //     subtitle: Text(
              //       'See Details',
              //       style: medium14(context)
              //           .copyWith(color: Colors.black.withOpacity(0.6)),
              //     ),
              //     trailing: SizedBox(
              //       width: width(context) * 0.29,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Column(
              //             children: [
              //               AppButton2(
              //                 text: 'Accept',
              //                 onPressed: () {},
              //                 buttonColor: AppColors.lightGreen,
              //                 buttonWidth: 0.15,
              //                 buttonHeight: isMobile(context) ? 0.025 : 0.022,
              //                 textStyle: medium13(context)
              //                     .copyWith(color: AppColors.primary),
              //               ),
              //               const Spacer(),
              //               AppButton2(
              //                 text: 'Decline',
              //                 onPressed: () {},
              //                 buttonColor: AppColors.lightYellow2,
              //                 buttonWidth: 0.15,
              //                 buttonHeight: isMobile(context) ? 0.025 : 0.022,
              //                 textStyle:
              //                     medium13(context).copyWith(color: AppColors.yellow),
              //               ),
              //             ],
              //           ),
              //           InkWell(
              //             onTap: () {},
              //             child: Icon(
              //               Icons.arrow_forward_ios_outlined,
              //               size: width(context) * 0.05,
              //               color: Colors.black,
              //             ),
              //           ),
              //         ],
              //       ),
              //     )),
              ),
        ),
      ),
    );
  }
}
