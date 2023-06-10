import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class DetailCard extends StatelessWidget {
  final String header;
  final String content;
  const DetailCard({super.key, required this.header, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width(context) * 0.02, vertical: height(context) * 0.025),
        child: Row(
          children: [
            Center(
              child: CircleAvatar(
                radius: width(context) * 0.04,
                backgroundColor: AppColors.lightAsh,
              ),
            ),
            SizedBox(width: width(context) * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: height(context)*0.01),
                  child: Text(header,
                      style:
                          medium14(context).copyWith(color: AppColors.primary)),
                ),
                Text(content,
                    style: medium11(context)
                        .copyWith(color: Colors.black.withOpacity(0.3)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
