import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              OnBoardingWidget(
                  painter: OnboardingCurve1(),
                  header: 'Get Hired as a Waste Truck Driver',
                  content:
                      'Sign in to your dashboard as a waste truck driver and get daily pickup tasks posted by the waste manager.',
                  image: '1',
                  imageWidth: 0.8,
                  imageHeight: 0.25,
                  imageTop: height(context) * 0.3),
              OnBoardingWidget(
                  painter: OnboardingCurve2(),
                  header: 'Continue as a Household Owner',
                  image: '2',
                  content:
                      'Get the opportunity to request for garbage pick-up in your homes, offices and environment as a Household owner.',
                  imageWidth: 0.9,
                  imageHeight: 0.35,
                  imageTop: height(context) * 0.25),
              OnBoardingWidget(
                  painter: OnboardingCurve3(),
                  header: 'Sign up to your Niche ',
                  image: '3',
                  imageWidth: 0.5,
                  content:
                      'Choose the dashboard that suits your needs, either as a truck driver or as a household owner.',
                  imageHeight: 0.35,
                  imageTop: height(context) * 0.25),
            ],
          ),
          Positioned(
              top: height(context) * 0.075,
              child: Column(
                children: [
                  Image.asset('assets/images/pickaboo_alt_logo.png'),
                  SizedBox(
                    width: width(context),
                    height: 2,
                  ),
                  Text(
                    'PIKABOO',
                    style: semi18(context).copyWith(color: Colors.white),
                  )
                ],
              )),
          Positioned(
              top: height(context) * 0.8,
              child: SizedBox(
                width: width(context),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                        dotHeight: height(context) * 0.014,
                        dotWidth: height(context) * 0.014,
                        expansionFactor: 3.2,
                        dotColor: AppColors.darkGreen.withOpacity(0.2),
                        activeDotColor: AppColors.darkGreen),
                  ),
                ),
              )),
          Positioned(
            top: height(context) * 0.88,
            child: SizedBox(
              width: width(context),
              child: Center(
                child: GradientButton(
                    text: 'Explore App',
                    onPressed: () {
                      context.goNamed(AppRouter.dashboard);
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
