import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../controllers/transactions/transactions_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class TransactionsHistoryView extends ConsumerWidget {
  const TransactionsHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getTransactions =
        ref.watch(transactionsProvider).getTransactionHistory(ref: ref);
    return Scaffold(
      appBar: customAppBar3(context,
          hasElevation: false, bgColor: AppColors.fadeGreen),
      body: SingleChildScrollView(
          child: SafeArea(
              child: FutureBuilder(
                  future: getTransactions,
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
                      final transactions =
                          ref.watch(transactionsProvider).transactions;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: AppColors.fadeGreen,
                            child: Padding(
                              padding: screenPadding(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height(context) * 0.01),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const PageHeader(
                                            title: 'Transaction History',
                                            hasSearch: false,
                                          ),
                                          Consumer(builder: (context, ref, _) {
                                            final isVisible =
                                                ref.watch(_visibleProvider);
                                            final amount = ref
                                                    .watch(authProvider)
                                                    .wallet ??
                                                '0.00';
                                            return Row(
                                              children: [
                                                Text(
                                                  !isVisible
                                                      ? 'Available Balance: NGN*****'
                                                      : 'Available Balance: NGN $amount',
                                                  style: medium14(context)
                                                      .copyWith(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.3)),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      ref
                                                          .read(_visibleProvider
                                                              .notifier)
                                                          .switchState();
                                                    },
                                                    icon: Icon(
                                                      isVisible
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                      size:
                                                          width(context) * 0.04,
                                                    ))
                                              ],
                                            );
                                          })
                                        ],
                                      ),
                                      const Spacer(),
                                      DriverRowIcon(
                                          bgColor: AppColors.lightYellow,
                                          title: '',
                                          image: 'transaction',
                                          onTap: () {}),
                                    ],
                                  ),
                                  SizedBox(height: height(context) * 0.01),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: screenPadding(context),
                            child: transactions.isEmpty
                                ? SizedBox(
                                    height: height(context) * 0.5,
                                    child: Center(
                                      child: Text(
                                        "You don't have any transactions yet",
                                        style: medium15(context),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: transactions.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return TransactionHistoryCard(
                                          transaction: transactions[i]);
                                    }),
                          )
                        ],
                      );
                    }
                  }))),
    );
  }
}

final _visibleProvider =
    NotifierProvider<_VisibleNotifier, bool>(_VisibleNotifier.new);

class _VisibleNotifier extends Notifier<bool> {
  @override
  build() {
    return false;
  }

  void switchState() {
    state = !state;
  }
}
