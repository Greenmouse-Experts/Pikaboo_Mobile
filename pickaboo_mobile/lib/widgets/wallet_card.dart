import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utilities/utilities.dart';

class WalletCard extends StatelessWidget {
  final String amount;
  const WalletCard({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: height(context) * 0.215,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              AppColors.primary.withOpacity(0.6),
              AppColors.primary
            ])),
        padding: EdgeInsets.all(width(context) * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Balance',
                style: medium13(context).copyWith(color: Colors.white)),
            Consumer(builder: (context, ref, child) {
              final isVisible = ref.watch(_visibleProvider);
              return Row(
                children: [
                  Text(
                      isVisible
                          ? 'NGN ${amount.formatWithCommas}'
                          : 'NGN *****',
                      style: medium20(context).copyWith(color: Colors.white)),
                  SizedBox(
                      width: isVisible
                          ? width(context) * 0.05
                          : width(context) * 0.15),
                  IconButton(
                      onPressed: () {
                        ref.read(_visibleProvider.notifier).switchVisibility();
                      },
                      icon: Icon(
                          !isVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.white,
                          size: isMobile(context)
                              ? width(context) * 0.06
                              : width(context) * 0.04))
                ],
              );
            }),
            Text('Upcoming Payment',
                style: medium13(context).copyWith(color: Colors.white)),
          ],
        ),
      ),
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

  void switchVisibility() {
    state = !state;
  }
}
