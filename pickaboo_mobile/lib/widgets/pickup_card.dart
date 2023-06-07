import 'package:flutter/material.dart';

import '../utilities/utilities.dart';
import 'app_button.dart';

class PickUpCard extends StatelessWidget {
  const PickUpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
            vertical: height(context) * 0.01, horizontal: 16),
        leading: Container(
          width: width(context) * 0.135,
          height: width(context) * 0.135,
          decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(width(context) * 0.0375),
            child: Image.asset(
              'assets/images/icons/driver.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text('New Pickup at OJOTA', style: medium13(context)),
        subtitle: Text(
          'Cancel',
          style:
              medium14(context).copyWith(color: Colors.black.withOpacity(0.25)),
        ),
        trailing: AppButton(text: 'Apply Now', onPressed: () {}, buttonWidth: 0.23,),
      ),
    );
  }
}
