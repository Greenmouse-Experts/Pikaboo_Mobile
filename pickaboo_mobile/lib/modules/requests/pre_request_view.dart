import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class PreRequestView extends StatelessWidget {
  const PreRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(context, actions: [
        const QuestionIcon(),
        SizedBox(width: width(context) * 0.04),
      ]),
      body: SafeArea(
          child: Padding(
        padding: screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height(context) * 0.05),
            Text('Select a pickup option.',
                style: medium16(context).copyWith(color: AppColors.primary)),
            SizedBox(height: height(context) * 0.02),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primary, width: 0.4)),
              child: ListTile(
                onTap: () => context.pushNamed(AppRouter.requestPickupView,
                    pathParameters: {'isSpecial': 'no'}),
                contentPadding: EdgeInsets.symmetric(
                    vertical: height(context) * 0.015,
                    horizontal: width(context) * 0.05),
                tileColor: AppColors.fadeGreen2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Padding(
                  padding: EdgeInsets.only(bottom: height(context) * 0.0075),
                  child: Text('Regular Request', style: medium14(context)),
                ),
                subtitle: Text(
                  'Get your waste pickup when our team gets dispatched to your area.',
                  style: medium12(context)
                      .copyWith(color: Colors.black.withOpacity(0.4)),
                ),
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: width(context) * 0.06,
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: height(context) * 0.02),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.darkBlue, width: 0.4)),
              child: ListTile(
                onTap: () => context.pushNamed(AppRouter.requestPickupView,
                    pathParameters: {'isSpecial': 'yes'}),
                contentPadding: EdgeInsets.symmetric(
                    vertical: height(context) * 0.015,
                    horizontal: width(context) * 0.05),
                tileColor: AppColors.darkBlueFade,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Padding(
                  padding: EdgeInsets.only(bottom: height(context) * 0.0075),
                  child: Text('Special Request', style: medium14(context)),
                ),
                subtitle: Text(
                  'Get exclusive pickup at your allocated time range to your location.',
                  style: medium12(context)
                      .copyWith(color: Colors.black.withOpacity(0.4)),
                ),
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: width(context) * 0.06,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
