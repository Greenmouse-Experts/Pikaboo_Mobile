import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/driver_requests/driver_request_controller.dart';
import '../../data/models/driver_schedule_schema.dart';
import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class DriverScheduledDetails extends ConsumerWidget {
  final String id;
  final String schedule;
  const DriverScheduledDetails({
    super.key,
    required this.id,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final realSchedule = DriverScheduleSchema.fromRawJson(schedule);
    final zone = realSchedule.cleanupRequest?.zone?.name ?? '';
    return Scaffold(
      appBar: customAppBar3(context, hasElevation: false),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: screenPadding(context),
          child: FutureBuilder<List<DriverScheduleResidenceSchema>>(
              future: ref
                  .watch(driverRequestProvider)
                  .getScheduledResidence(ref: ref, id: id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const PageLoader();
                } else if (snapshot.hasError) {
                  return AppErrorWidget(
                      widgetHeight: 0.7,
                      errorType: snapshot.error.runtimeType,
                      error: snapshot.error.toString());
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PageHeader(title: '$zone Requests', hasSearch: false),
                      SizedBox(height: height(context) * 0.01),
                      Text('Available garbage pickup in $zone today.',
                          style: medium13(context)
                              .copyWith(color: Colors.black.withOpacity(0.4))),
                      SizedBox(height: height(context) * 0.02),
                      Consumer(builder: (context, ref, child) {
                        final i = ref.watch(_pageProvider);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategorySelector(
                              isSelected: i == 0,
                              title: 'All',
                              onSelected: () {
                                ref.read(_pageProvider.notifier).updatePage(0);
                              },
                            ),
                            CategorySelector(
                              isSelected: i == 1,
                              title: 'Pending',
                              onSelected: () {
                                ref.read(_pageProvider.notifier).updatePage(1);
                              },
                            ),
                            CategorySelector(
                              isSelected: i == 2,
                              title: 'Completed',
                              onSelected: () {
                                ref.read(_pageProvider.notifier).updatePage(2);
                              },
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: height(context) * 0.01),
                      Consumer(builder: (context, ref, child) {
                        final i = ref.watch(_pageProvider);
                        final addresses = snapshot.data;

                        if (addresses == null) {
                          return const Center(
                              child:
                                  Text('You have no scheduled requests yet'));
                        } else {
                          final pendingAddresses = addresses
                              .where((element) => element.status == 'PENDING')
                              .toList();

                          final completedAddresses = addresses
                              .where((element) => element.status == 'COMPLETED')
                              .toList();

                          return i == 0
                              ? addresses.isEmpty
                                  ? SizedBox(
                                      height: height(context) * 0.25,
                                      child: Center(
                                        child: Text(
                                            'You have no scheduled pick ups yet',
                                            textAlign: TextAlign.center,
                                            style: medium15(context)),
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: addresses.length,
                                      itemBuilder: (context, i) {
                                        return PickupAddressTile(
                                          isFirst: i == 0,
                                          isLast: i == addresses.length - 1,
                                          request: addresses[i],
                                        );
                                      })
                              : i == 1
                                  ? pendingAddresses.isEmpty
                                      ? SizedBox(
                                          height: height(context) * 0.25,
                                          child: Center(
                                            child: Text(
                                                'You have no pending pick ups',
                                                textAlign: TextAlign.center,
                                                style: medium15(context)),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: pendingAddresses.length,
                                          itemBuilder: (context, i) {
                                            return AddressCard(
                                              isPending: true,
                                              address: pendingAddresses[i],
                                            );
                                          })
                                  : completedAddresses.isEmpty
                                      ? SizedBox(
                                          height: height(context) * 0.25,
                                          child: Center(
                                            child: Text(
                                                'You have no completed pick ups yet',
                                                textAlign: TextAlign.center,
                                                style: medium15(context)),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: completedAddresses.length,
                                          itemBuilder: (context, i) {
                                            return AddressCard(
                                              isPending: false,
                                              address: completedAddresses[i],
                                            );
                                          });
                        }
                      })
                    ],
                  );
                }
              }),
        ),
      )),
    );
  }
}

final _pageProvider = NotifierProvider<_PageNotifier, int>(_PageNotifier.new);

class _PageNotifier extends Notifier<int> {
  @override
  build() {
    return 0;
  }

  void updatePage(int i) {
    if (state == i) {
    } else {
      state = i;
    }
  }
}
