import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/requests/request_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class PickUpRequestView extends ConsumerWidget {
  const PickUpRequestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getRequests = ref.watch(requestProvider);
    return Scaffold(
      appBar: customAppBar3(context, hasElevation: false),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: screenPadding(context),
          child: FutureBuilder(
              future: getRequests.getAllRequests(ref: ref),
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
                      const PageHeader(
                          title: 'Pickup Requests', hasSearch: false),
                      SizedBox(height: height(context) * 0.01),
                      Text('Available garbage pickup in your location today.',
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
                              title: 'Scheduled Requests',
                              onSelected: () {
                                ref.read(_pageProvider.notifier).updatePage(0);
                              },
                            ),
                            CategorySelector(
                              isSelected: i == 1,
                              title: 'Special Calls',
                              onSelected: () {
                                ref.read(_pageProvider.notifier).updatePage(1);
                              },
                            ),
                            // // CategorySelector(
                            // //   isSelected: i == 2,
                            // //   title: 'Finished',
                            // //   onSelected: () {
                            // //     ref.read(_pageProvider.notifier).updatePage(2);
                            // //   },
                            // // ),
                          ],
                        );
                      }),
                      SizedBox(height: height(context) * 0.01),
                      Consumer(builder: (context, ref, child) {
                        final i = ref.watch(_pageProvider);
                        final cleanUpRequests =
                            ref.watch(requestProvider).cleanUpRequests;

                        return i == 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: cleanUpRequests.length,
                                itemBuilder: (context, i) {
                                  return PickupTile(
                                    isFirst: i == 0,
                                    isLast: i == cleanUpRequests.length - 1,
                                    request: cleanUpRequests[i],
                                  );
                                })
                            : i == 1
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 6,
                                    itemBuilder: (context, i) {
                                      return const PickUpCard(
                                        isActive: true,
                                      );
                                    })
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 6,
                                    itemBuilder: (context, i) {
                                      return const PickUpCard(
                                        isActive: false,
                                      );
                                    });
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
