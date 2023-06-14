import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utilities/utilities.dart';
import '../../../widgets/widgets.dart';

class AnonHomeView extends StatelessWidget {
  const AnonHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, hasElevation: false, actions: [
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: screenPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    padding: EdgeInsets.all(width(context) * 0.025),
                    decoration: BoxDecoration(
                        gradient: const RadialGradient(
                          radius: 0.7,
                          colors: [
                            AppColors.primaryLight,
                            AppColors.primary,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        const AppImage(
                            image: 'assets/images/truck.png',
                            imageHeight: 0.18,
                            imageWidth: 0.40),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: width(context) * 0.45,
                                child: Text(
                                    'Get instant waste pick up in your area',
                                    style: semi18(context)
                                        .copyWith(color: Colors.white),
                                    textAlign: TextAlign.end)),
                            SizedBox(height: height(context) * 0.0125),
                            AppButton(
                              text: 'LOGIN',
                              onPressed: () {},
                              buttonWidth: 0.2,
                              buttonHeight: 0.04,
                              buttonColor: Colors.white,
                              textColor: Colors.green,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height(context) * 0.02),
                Text('Get Started with PIKABOO', style: medium16(context)),
                SizedBox(height: height(context) * 0.02),
                Row(
                  children: [
                    AppButton(
                      text: 'FAQs',
                      onPressed: () => context.pushNamed(AppRouter.faq),
                      buttonWidth: 0.23,
                      buttonHeight: 0.05,
                    ),
                    const SizedBox(width: 15),
                    AppButton(
                      text: 'Terms  & Conditions',
                      onPressed: () => context.pushNamed(AppRouter.terms,
                          pathParameters: {'isAnon': 'yes'}),
                      buttonColor: AppColors.orange,
                      buttonWidth: 0.4,
                      buttonHeight: 0.05,
                    ),
                  ],
                ),
                SizedBox(height: height(context) * 0.03),
                Text('What we Do!', style: medium16(context)),
                SizedBox(height: height(context) * 0.02),
                const InfoWidget(
                    color: AppColors.fadeGreen2,
                    title: 'Waste Pickup',
                    content:
                        "Sign in as a truck driver and get paid to pick up waste in your preferred locations",
                    image: 'assets/images/wastetruck.png'),
                SizedBox(height: height(context) * 0.02),
                const InfoWidget(
                    color: AppColors.fadePurple,
                    title: 'Household Owner',
                    content:
                        "Sign in as a household owner and get request for garbage pick up waste your location.",
                    image: 'assets/images/dump.png'),
                SizedBox(height: height(context) * 0.015),
                Text('Users Sign In', style: medium16(context)),
                SizedBox(height: height(context) * 0.015),
                AppButton(
                    text: 'Login',
                    onPressed: () {
                      context.pushNamed(AppRouter.chooseSignIn);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
