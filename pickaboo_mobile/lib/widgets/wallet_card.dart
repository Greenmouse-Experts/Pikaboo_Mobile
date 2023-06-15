import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

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
            Row(
              children: [
                Text('NGN 13,000',
                    style: medium20(context).copyWith(color: Colors.white)),
                SizedBox(width: width(context) * 0.05),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_outlined,
                    color: Colors.white,
                        size: width(context) * 0.06))
              ],
            ),
            Text('Upcoming Payment',
                style: medium13(context).copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
