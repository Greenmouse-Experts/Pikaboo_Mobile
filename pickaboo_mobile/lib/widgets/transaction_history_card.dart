import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Fri Jun 9, 2023',
                style: regular13(context)
                    .copyWith(color: Colors.black.withOpacity(0.4))),
            const Spacer(),
            Text('NGN (6, 000)',
                style: medium14(context).copyWith(color: AppColors.error))
          ],
        ),
        SizedBox(height: height(context) * 0.01),
        Row(
          children: [
            Text('Waste Bin Purchase', style: medium14(context)),
            const Spacer(),
            Text('Tap to view or download receipt',
                style: regular11(context)
                    .copyWith(color: Colors.black.withOpacity(0.4)))
          ],
        ),
        SizedBox(height: height(context) * 0.01),
        const Divider(),
        SizedBox(height: height(context) * 0.015),
      ],
    );
  }
}
