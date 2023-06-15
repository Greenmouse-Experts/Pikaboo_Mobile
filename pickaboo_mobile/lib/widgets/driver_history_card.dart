import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

import '../utilities/utilities.dart';

class DriverHistoryCard extends StatelessWidget {
  const DriverHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height(context) * 0.01,
            horizontal: width(context) * 0.02),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: AppColors.error,
                  size: width(context) * 0.06,
                ),
                SizedBox(width: width(context) * 0.035),
                const LocationText(),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_outline_outlined,
                        color: AppColors.error, size: width(context) * 0.06))
              ],
            ),
            SizedBox(height: height(context) * 0.0125),
            Divider(color: Colors.black.withOpacity(0.2)),
            SizedBox(height: height(context) * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jun 6, 2023',
                    style: regular13(context)
                        .copyWith(color: Colors.black.withOpacity(0.4))),
                Text('Completed',
                    style:
                        regular13(context).copyWith(color: AppColors.success))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NewDotLine extends StatelessWidget {
  final bool isExpanded;
  const NewDotLine({super.key, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isExpanded ? null : height(context) * 0.06,
      child: const DottedLine(
        dashGapLength: 2,
        dashLength: 2,
        direction: Axis.vertical,
        dashColor: AppColors.primary,
      ),
    );
  }
}

class LocationText extends StatelessWidget {
  const LocationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pen Cinema', style: semi13(context)),
        SizedBox(height: height(context) * 0.001),
        Text('AGEGE',
            style: regular13(context)
                .copyWith(color: Colors.black.withOpacity(0.4)))
      ],
    );
  }
}
