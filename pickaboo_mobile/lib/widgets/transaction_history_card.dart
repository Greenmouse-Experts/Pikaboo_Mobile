import 'package:flutter/material.dart';

import '../data/models/models.dart';
import '../utilities/utilities.dart';

class TransactionHistoryCard extends StatelessWidget {
  final TransactionSchema transaction;
  const TransactionHistoryCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(transaction.createdAt!.formatedDate,
                style: regular13(context)
                    .copyWith(color: Colors.black.withOpacity(0.4))),
            const Spacer(),
            Text('NGN ${(transaction.amount ?? '0').formatWithCommas}',
                style: medium14(context).copyWith(color: AppColors.error))
          ],
        ),
        SizedBox(height: height(context) * 0.01),
        Row(
          children: [
            Text(transaction.type ?? '', style: medium14(context)),
            const Spacer(),
            Text('Status : ${(transaction.status ?? '').capitalizeFirst()}',
                style: regular13(context).copyWith(color: AppColors.primary))
          ],
        ),
        SizedBox(height: height(context) * 0.01),
        const Divider(),
        SizedBox(height: height(context) * 0.015),
      ],
    );
  }
}

class DoubleTitle extends StatelessWidget {
  final String leadingTitle, leadingContent, trailingTitle, trailingContent;
  final bool hasBackground;

  const DoubleTitle(
      {super.key,
      required this.leadingTitle,
      required this.leadingContent,
      required this.trailingTitle,
      required this.trailingContent,
      required this.hasBackground});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: hasBackground ? AppColors.fadeGreen : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height(context) * 0.01),
          Row(
            children: [
              Text(leadingTitle, style: regular16(context)),
              const Spacer(),
              Text(trailingTitle, style: medium16(context))
            ],
          ),
          SizedBox(height: height(context) * 0.01),
          Row(
            children: [
              Text(leadingContent,
                  style: regular13(context).copyWith(color: AppColors.darkAsh)),
              const Spacer(),
              Text(trailingContent,
                  style: regular13(context).copyWith(color: AppColors.darkAsh))
            ],
          ),
          SizedBox(height: height(context) * 0.01),
          !hasBackground ? const Divider() : const SizedBox(),
          SizedBox(height: height(context) * 0.015),
        ],
      ),
    );
  }
}

class CustomDoubleTitle extends StatelessWidget {
  final String leadingTitle, leadingContent;
  final bool isLast;
  final Widget customEnd;
  const CustomDoubleTitle({
    super.key,
    this.isLast = false,
    required this.leadingTitle,
    required this.leadingContent,
    required this.customEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: isLast
                        ? height(context) * 0.005
                        : height(context) * 0.01),
                Text(leadingTitle, style: regular16(context)),
                SizedBox(height: height(context) * 0.01),
                Text(leadingContent,
                    style:
                        regular13(context).copyWith(color: AppColors.darkAsh)),
                SizedBox(height: height(context) * 0.01),
              ],
            ),
            const Spacer(),
            customEnd
          ],
        ),
        !isLast ? const Divider() : const SizedBox(),
        !isLast ? SizedBox(height: height(context) * 0.015) : const SizedBox(),
      ],
    );
  }
}
