import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../controllers/special_requests.dart/special_request_controller.dart';
import '../../controllers/user_requests/user_request_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class UserRequestsView extends ConsumerWidget {
  const UserRequestsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    return Scaffold(
      appBar: customAppBar5(
        context,
        hasElevation: false,
      ),
      body: SafeArea(
          child: Padding(
              padding: screenPadding(context),
              child: FutureBuilder(
                  future: Future.wait([
                    ref.watch(specialProvider).getSpecialRequestHistory(ref),
                    ref
                        .watch(userRequestProvider)
                        .getSscheduledRequests(ref: ref)
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const PageLoader();
                    } else if (snapshot.hasError) {
                      return AppErrorWidget(
                          //snapshot.error!
                          widgetHeight: 0.7,
                          errorType: snapshot.error.runtimeType,
                          error: snapshot.error.toString());
                    } else {
                      final specials =
                          ref.watch(specialProvider).specialRequests;
                      final scheduled =
                          ref.watch(userRequestProvider).userRequests;
                      return DefaultTabController(
                        length: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const PageHeader(
                                title: 'My Requests', hasSearch: false),
                            TabBar(
                                labelColor: Colors.black,
                                unselectedLabelColor:
                                    Colors.black.withOpacity(0.4),
                                labelStyle: medium13(context),
                                unselectedLabelStyle: medium13(context)
                                    .copyWith(
                                        color: Colors.black.withOpacity(0.4)),
                                indicatorColor: AppColors.darkGreen,
                                tabs: const [
                                  Tab(text: 'Scheduled'),
                                  Tab(text: 'Special Calls'),
                                  // Tab(text: 'What’s new'),
                                ]),
                            Expanded(
                              child: TabBarView(children: [
                                scheduled.isEmpty
                                    ? Center(
                                        child: Text(
                                        'You currently have no scheduled requests',
                                        style: medium15(context),
                                      ))
                                    : ListView.builder(
                                        itemCount: scheduled.length,
                                        // shrinkWrap: true,
                                        // physics:
                                        //     const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          // return const RequestCard(
                                          //   isUser: true,
                                          // );
                                          final address =
                                              "${scheduled[i].residence?.houseNumber ?? ""}, ${scheduled[i].residence?.streetName ?? " "},${scheduled[i].residence?.lga ?? ""}";
                                          return NewPickUpTile(
                                              address: address,
                                              date: scheduled[i].createdAt!,
                                              price: (scheduled[i].price ?? "0")
                                                  .formatWithCommas);
                                        }),
                                specials.isEmpty
                                    ? Center(
                                        child: Text(
                                        'You currently have no special requests',
                                        style: medium15(context),
                                      ))
                                    : ListView.builder(
                                        itemCount: specials.length,
                                        // shrinkWrap: true,
                                        // physics:
                                        //     const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          // return const RequestCard(
                                          //   isUser: true,
                                          // );

                                          return NewPickUpTile(
                                              address: specials[i].altAddress ??
                                                  user?.address ??
                                                  "",
                                              date: specials[i].completedDate ??
                                                  specials[i].createdAt!,
                                              price: (specials[i].price ?? "0")
                                                  .toString());
                                        })
                              ]),
                            )
                          ],
                        ),
                      );
                    }
                  })

              // Column(
              //   children: [

              // const PageHeader(title: 'My Requests', hasSearch: false),
              // SizedBox(height: height(context) * 0.02),
              //
              //  ],
              // ),
              )),
    );
  }
}
