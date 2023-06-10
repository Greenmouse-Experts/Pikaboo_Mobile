import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class NotificationTile extends StatelessWidget {
  final bool isUnread;
  const NotificationTile({super.key, this.isUnread = true});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isUnread ? AppColors.fadeGreen : Colors.white,
      contentPadding: EdgeInsets.symmetric(
          vertical: height(context) * 0.01, horizontal: 16),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: AppColors.primary,
        ),
        width: width(context) * 0.125,
        height: width(context) * 0.125,
        child: Padding(
            padding: EdgeInsets.all(width(context) * 0.035),
            child: Image.asset('assets/images/icons/notification.png')),
      ),
      title: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eros ligula.',
        style: medium13(context).copyWith(color: Colors.black.withOpacity(0.4)),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz_outlined,
            color: Colors.black,
          )),
    );
  }
}
