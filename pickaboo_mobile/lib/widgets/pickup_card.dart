import 'package:flutter/material.dart';

import '../utilities/utilities.dart';
import 'app_button.dart';

class PickUpPreview extends StatelessWidget {
  const PickUpPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
          contentPadding: EdgeInsets.only(
            top: height(context) * 0.01,
            left: 16,
            right: 4,
            bottom: height(context) * 0.01,
          ),
          leading: Container(
              width: width(context) * 0.135,
              height: width(context) * 0.135,
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.delete_outline_outlined,
                color: AppColors.primary,
                size: width(context) * 0.06,
              )),
          title: Text('New Pickup at OJOTA', style: medium13(context)),
          subtitle: Text(
            'See Details',
            style: medium14(context)
                .copyWith(color: Colors.black.withOpacity(0.25)),
          ),
          trailing: SizedBox(
            width: width(context) * 0.27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    AppButton2(
                      text: 'Accept',
                      onPressed: () {},
                      buttonColor: AppColors.lightGreen,
                      buttonWidth: 0.15,
                      buttonHeight: isMobile(context) ? 0.025 : 0.022,
                      textStyle:
                          medium11(context).copyWith(color: AppColors.primary),
                    ),
                    const Spacer(),
                    AppButton2(
                      text: 'Decline',
                      onPressed: () {},
                      buttonColor: AppColors.lightYellow2,
                      buttonWidth: 0.15,
                      buttonHeight: isMobile(context) ? 0.025 : 0.022,
                      textStyle:
                          medium11(context).copyWith(color: AppColors.yellow),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  splashRadius: width(context) * 0.05,
                  iconSize: width(context) * 0.05,
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: width(context) * 0.05,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
