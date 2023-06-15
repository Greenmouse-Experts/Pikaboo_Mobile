import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

import '../utilities/utilities.dart';

class PickupTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  const PickupTile({super.key, required this.isFirst, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,

      leading: Column(
        children: [
          !isFirst ? const DotLine() : SizedBox(height: height(context) * 0.01),
          Container(
            width: width(context) * 0.05,
            height: width(context) * 0.05,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(width(context) * 0.015),
              child: Container(
                width: width(context) * 0.05,
                height: width(context) * 0.05,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          isLast
              ? SizedBox(
                  height: height(context) * 0.01,
                )
              : const Expanded(
                  child: DotLine(
                  isExpanded: true,
                ))
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Pickup address',
              style: medium11(context)
                  .copyWith(color: Colors.black.withOpacity(0.4))),
          SizedBox(height: height(context) * 0.0002),
          Text('Maclemore Street', style: semi13(context)),
  SizedBox(height: height(context) * 0.0002),
        ],
      ),
      subtitle: Text('OJOTA',
          style:
              medium11(context).copyWith(color: Colors.black.withOpacity(0.4))),
      trailing: Container(
        width: width(context) * 0.06,
        height: width(context) * 0.06,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
        child:
            Icon(Icons.check, size: width(context) * 0.05, color: Colors.white),
      ),
    );
  }
}

class DotLine extends StatelessWidget {
  final bool isExpanded;
  const DotLine({super.key, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isExpanded ? null : height(context) * 0.01,
      child: const DottedLine(
        dashGapLength: 2,
        dashLength: 2,
        direction: Axis.vertical,
        dashColor: AppColors.primary,
      ),
    );
  }
}
