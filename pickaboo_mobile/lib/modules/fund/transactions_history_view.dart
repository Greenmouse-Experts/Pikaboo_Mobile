import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class TransactionsHistoryView extends StatelessWidget {
  const TransactionsHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar3(context,
          hasElevation: false, bgColor: AppColors.fadeGreen),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PageHeader(
                            title: 'Transaction History',
                            hasSearch: false,
                          ),
                          Row(
                            children: [
                              Text(
                                'Available Balance: NGN*****',
                                style: medium14(context).copyWith(
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.visibility_outlined,
                                    size: width(context) * 0.04,
                                  ))
                            ],
                          )
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
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return const TransactionHistoryCard();
                }),
          )
        ],
      ))),
    );
  }
}
