import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/driver_requests/driver_request_controller.dart';
import '../../data/models/driver_schedule_schema.dart';
// import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

enum ScheduleStatus { all, pending, completed }

class DriverScheduledDetails extends HookConsumerWidget {
  final String id;
  final String schedule;
  const DriverScheduledDetails({
    super.key,
    required this.id,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterStatus = useState(ScheduleStatus.all);
    final realSchedule = DriverScheduleSchema.fromRawJson(schedule);
    final driverscheduleasync = ref.watch(driverScheduledResidenceProvider(id));
    final zone = realSchedule.cleanupRequest?.zone?.name ?? '';
    return Scaffold(
      appBar: customAppBar3(context, hasElevation: false),
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: SafeArea(
          child: Padding(
            padding: screenPadding(context),
            child: driverscheduleasync.when(
              data: (requests) {
                final data = filterStatus.value == ScheduleStatus.all
                    ? requests
                    : filterStatus.value == ScheduleStatus.pending
                        ? requests
                            .where((element) => element.status == 'PENDING')
                            .toList()
                        : requests
                            .where((element) => element.status == 'COMPLETED')
                            .toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PageHeader(title: '$zone Requests', hasSearch: false),
                    SizedBox(height: height(context) * 0.01),
                    Text('Available garbage pickup in $zone today.',
                        style: medium13(context)
                            .copyWith(color: Colors.black.withOpacity(0.4))),
                    SizedBox(height: height(context) * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ScheduleStatus.values.map((e) {
                        return CategorySelector(
                          isSelected: filterStatus.value == e,
                          title: e.name.capitalizeFirst(),
                          onSelected: () {
                            filterStatus.value = e;
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: height(context) * 0.06),
                    Expanded(
                      child: Visibility(
                        visible: data.isNotEmpty,
                        replacement: SizedBox(
                          height: height(context) * 0.25,
                          child: Center(
                            child: Text(
                                'You have no ${filterStatus.value.name} pick ups',
                                textAlign: TextAlign.center,
                                style: medium15(context)),
                          ),
                        ),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            return await Future.microtask(() => ref
                                .invalidate(driverScheduledResidenceProvider));
                          },
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, i) {
                                return Visibility(
                                  visible:
                                      filterStatus.value != ScheduleStatus.all,
                                  replacement: PickupAddressTile(
                                    isFirst: i == 0,
                                    isLast: i == data.length - 1,
                                    request: data[i],
                                  ),
                                  child: AddressCard(
                                    cleanUpId: id,
                                    isPending: data[i].status == 'PENDING'
                                        ? true
                                        : false,
                                    address: data[i],
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                );
              },
              error: (error, _) => AppErrorWidget(
                widgetHeight: 0.7,
                errorType: error.runtimeType,
                error: error.toString(),
              ),
              loading: () => const PageLoader(),
            ),
          ),
        ),
      ),
    );
  }
}


  // FutureBuilder<List<DriverScheduleResidenceSchema>> driverfuturebuilder(
  //     WidgetRef ref, String zone) {
  //   return FutureBuilder<List<DriverScheduleResidenceSchema>>(
  //       future: ref.watch(driverRequestProvider).getScheduledResidence(id: id),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const PageLoader();
  //         } else if (snapshot.hasError) {
  //           return AppErrorWidget(
  //               widgetHeight: 0.7,
  //               errorType: snapshot.error.runtimeType,
  //               error: snapshot.error.toString());
  //         } else {
  //           return Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               PageHeader(title: '$zone Requests', hasSearch: false),
  //               SizedBox(height: height(context) * 0.01),
  //               Text('Available garbage pickup in $zone today.',
  //                   style: medium13(context)
  //                       .copyWith(color: Colors.black.withOpacity(0.4))),
  //               SizedBox(height: height(context) * 0.02),
  //               Consumer(builder: (context, ref, child) {
  //                 final i = ref.watch(_pageProvider);
  //                 return Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     CategorySelector(
  //                       isSelected: i == 0,
  //                       title: 'All',
  //                       onSelected: () {
  //                         ref.read(_pageProvider.notifier).updatePage(0);
  //                       },
  //                     ),
  //                     CategorySelector(
  //                       isSelected: i == 1,
  //                       title: 'Pending',
  //                       onSelected: () {
  //                         ref.read(_pageProvider.notifier).updatePage(1);
  //                       },
  //                     ),
  //                     CategorySelector(
  //                       isSelected: i == 2,
  //                       title: 'Completed',
  //                       onSelected: () {
  //                         ref.read(_pageProvider.notifier).updatePage(2);
  //                       },
  //                     ),
  //                   ],
  //                 );
  //               }),
  //               SizedBox(height: height(context) * 0.01),
  //               Consumer(builder: (context, ref, child) {
  //                 final i = ref.watch(_pageProvider);
  //                 final addresses = snapshot.data;

  //                 if (addresses == null) {
  //                   return const Center(
  //                       child: Text('You have no scheduled requests yet'));
  //                 } else {
  //                   final pendingAddresses = addresses
  //                       .where((element) => element.status == 'PENDING')
  //                       .toList();

  //                   final completedAddresses = addresses
  //                       .where((element) => element.status == 'COMPLETED')
  //                       .toList();

  //                   return i == 0
  //                       ? addresses.isEmpty
  //                           ? SizedBox(
  //                               height: height(context) * 0.25,
  //                               child: Center(
  //                                 child: Text(
  //                                     'You have no scheduled pick ups yet',
  //                                     textAlign: TextAlign.center,
  //                                     style: medium15(context)),
  //                               ),
  //                             )
  //                           : ListView.builder(
  //                               shrinkWrap: true,
  //                               physics: const NeverScrollableScrollPhysics(),
  //                               itemCount: addresses.length,
  //                               itemBuilder: (context, i) {
  //                                 return PickupAddressTile(
  //                                   isFirst: i == 0,
  //                                   isLast: i == addresses.length - 1,
  //                                   request: addresses[i],
  //                                 );
  //                               })
  //                       : i == 1
  //                           ? pendingAddresses.isEmpty
  //                               ? SizedBox(
  //                                   height: height(context) * 0.25,
  //                                   child: Center(
  //                                     child: Text(
  //                                         'You have no pending pick ups',
  //                                         textAlign: TextAlign.center,
  //                                         style: medium15(context)),
  //                                   ),
  //                                 )
  //                               : ListView.builder(
  //                                   shrinkWrap: true,
  //                                   physics:
  //                                       const NeverScrollableScrollPhysics(),
  //                                   itemCount: pendingAddresses.length,
  //                                   itemBuilder: (context, i) {
  //                                     return AddressCard(
  //                                       cleanUpId: id,
  //                                       isPending: true,
  //                                       address: pendingAddresses[i],
  //                                     );
  //                                   })
  //                           : completedAddresses.isEmpty
  //                               ? SizedBox(
  //                                   height: height(context) * 0.25,
  //                                   child: Center(
  //                                     child: Text(
  //                                         'You have no completed pick ups yet',
  //                                         textAlign: TextAlign.center,
  //                                         style: medium15(context)),
  //                                   ),
  //                                 )
  //                               : ListView.builder(
  //                                   shrinkWrap: true,
  //                                   physics:
  //                                       const NeverScrollableScrollPhysics(),
  //                                   itemCount: completedAddresses.length,
  //                                   itemBuilder: (context, i) {
  //                                     return AddressCard(
  //                                       cleanUpId: id,
  //                                       isPending: false,
  //                                       address: completedAddresses[i],
  //                                     );
  //                                   });
  //                 }
  //               })
  //             ],
  //           );
  //         }
  //       });
  // }


// final _pageProvider = NotifierProvider<_PageNotifier, int>(_PageNotifier.new);



// class _PageNotifier extends Notifier<int> {
//   @override
//   build() {
//     return 0;
//   }

//   void updatePage(int i) {
//     if (state == i) {
//     } else {
//       state = i;
//     }
//   }
// }
