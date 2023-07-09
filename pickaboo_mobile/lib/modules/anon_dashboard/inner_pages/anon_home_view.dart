import 'package:carousel_slider/carousel_slider.dart';
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
        const QuestionIcon(),
        SizedBox(width: width(context) * 0.04),
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: screenPadding(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context, index, i) {
                    return index == 0
                        ? const CardSlide1()
                        : index == 1
                            ? const CardSlide3()
                            : const CardSlide2();
                  },
                  options: CarouselOptions(
                    height: height(context) * 0.2,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                ),
                SizedBox(height: height(context) * 0.022),
                Text('Get Started with PIKABOO', style: medium16(context)),
                SizedBox(height: height(context) * 0.022),
                Row(
                  children: [
                    AppButton(
                      text: 'FAQs',
                      onPressed: () => context.pushNamed(AppRouter.anonfaq),
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
                SizedBox(height: height(context) * 0.025),
                Text('What we Do!', style: medium16(context)),
                SizedBox(height: height(context) * 0.022),
                const InfoWidget(
                    color: AppColors.fadeGreen2,
                    title: 'Service Personnel',
                    content:
                        "Sign in as a truck driver and get paid to pick up waste in your preferred locations",
                    image: 'assets/images/wastetruck.png'),
                SizedBox(height: height(context) * 0.02),
                const InfoWidget(
                    color: AppColors.fadePurple,
                    title: 'Home Resident',
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
