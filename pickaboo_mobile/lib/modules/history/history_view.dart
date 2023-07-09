import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../controllers/orders/order_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeOwner = ref.watch(authProvider).user;
    final name = homeOwner?.firstName ?? '';
    final image = homeOwner?.avatar ?? '';
    return Scaffold(
      appBar: customAppBar3(context, hasElevation: false, actions: [
        AppBarIcon(name: name, image: image),
        SizedBox(width: width(context) * 0.04)
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: FutureBuilder(
              future: ref.watch(orderProvider).getOrderHistory(ref: ref),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const PageLoader();
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  final orders = ref.watch(orderProvider).orders;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageHeader(
                          title: 'Order History', hasSearch: false),
                      SizedBox(height: height(context) * 0.01),
                      Text('All History', style: medium13(context)),
                      SizedBox(height: height(context) * 0.01),
                      orders.isEmpty
                          ? Container(
                              alignment: Alignment.center,
                              height: height(context) * 0.8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Text(
                                    "You don't have any orders yet, make a purchase and try again later",
                                    textAlign: TextAlign.center,
                                    style: medium16(context),
                                  )),
                                  SizedBox(height: height(context) * 0.02),
                                  AppButton(
                                      text: 'Proceed to Shop',
                                      buttonWidth: 0.5,
                                      onPressed: () {
                                        context.goNamed(AppRouter.marketplace);
                                      })
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: orders.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) {
                                return OrderTile(
                                  order: orders[i],
                                );
                              }),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20)),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(5),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         SizedBox(
                      //             width: width(context),
                      //             height: height(context) * 0.01),
                      //         Padding(
                      //           padding: const EdgeInsets.symmetric(
                      //               horizontal: 16.0),
                      //           child: Text('Today - Monday, June 5, 2023',
                      //               style: medium13(context)),
                      //         ),
                      //         SizedBox(height: height(context) * 0.01),
                      //         ListView.builder(
                      //             itemCount: 20,
                      //             shrinkWrap: true,
                      //             physics: const NeverScrollableScrollPhysics(),
                      //             itemBuilder: (context, i) {
                      //               return const HistoryTile();
                      //             }),
                      //         SizedBox(height: height(context) * 0.01),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                }
              }),
        )),
      ),
    );
  }
}
