import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/special_requests.dart/special_request_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class UserRequestsView extends ConsumerWidget {
  const UserRequestsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar5(
        context,
        hasElevation: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding: screenPadding(context),
                child: FutureBuilder(
                    future: ref
                        .watch(specialProvider)
                        .getSpecialRequestHistory(ref),
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
                                            color:
                                                Colors.black.withOpacity(0.4)),
                                    indicatorColor: AppColors.darkGreen,
                                    tabs: const [
                                      Tab(text: 'Scheduled'),
                                      Tab(text: 'Special Calls'),
                                      // Tab(text: 'What’s new'),
                                    ]),
                                SizedBox(
                                    height: !isMobile(context)
                                        ? height(context) * 0.805
                                        : Platform.isIOS
                                            ? adjustedHeight(context) * 0.88
                                            : adjustedHeight(context) * 0.92,
                                    child: TabBarView(children: [
                                      Center(
                                          child: Text(
                                        'You currently have no scheduled requests',
                                        style: medium15(context),
                                      )),
                                      ListView.builder(
                                          itemCount: specials.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, i) {
                                            // return const RequestCard(
                                            //   isUser: true,
                                            // );

                                            return DoubleTitle(
                                                leadingTitle:
                                                    ' Request Date: ${specials[i].scheduleDate}',
                                                leadingContent:
                                                    ' Status: ${specials[i].status}',
                                                trailingTitle: '',
                                                trailingContent: '',
                                                hasBackground: i % 2 == 0);
                                          })
                                    ]))
                              ],
                            ));
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
      ),
    );
  }
}
