import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class ChooseSignInView extends StatelessWidget {
  const ChooseSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(context, actions: [
        IconButton(
            onPressed: () {},
            icon: Container(
              width: width(context) * 0.06,
              height: width(context) * 0.06,
              decoration: const BoxDecoration(
                  color: AppColors.newAsh, shape: BoxShape.circle),
              child: Icon(
                Icons.question_mark_outlined,
                color: AppColors.error,
                size: width(context) * 0.04,
              ),
            )),
        SizedBox(width: width(context) * 0.04),
      ]),
      body: SafeArea(
          child: Padding(
        padding: screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height(context) * 0.05),
            Text('What are you signing in as ? ',
                style: medium16(context).copyWith(color: AppColors.primary)),
            SizedBox(height: height(context) * 0.02),
            ChooseSignIn(
                onPressed: () => context.pushNamed(AppRouter.login,
                    pathParameters: {'type': 'driver'}),
                color: AppColors.fadeGreen2,
                title: 'Service Personnel',
                content:
                    "Sign in as a truck driver and get paid to pick up waste in your preferred locations",
                image: 'assets/images/wastetruck.png'),
            SizedBox(height: height(context) * 0.015),
            ChooseSignIn(
                onPressed: () => context.pushNamed(AppRouter.login,
                    pathParameters: {'type': 'user'}),
                color: AppColors.fadePurple,
                title: 'Home Resident',
                content:
                    "Sign in as a household owner and get request for garbage pick up waste your location.",
                image: 'assets/images/dump.png'),
          ],
        ),
      )),
    );
  }
}
