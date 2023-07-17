import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class OnBoardingView extends ConsumerWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PageController();
    ref.read(authProvider.notifier).setFirstTimeUser();
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, i) {
              return index == 0
                  ? OnBoardingWidget(
                      painter: OnboardingCurve1(),
                      header: 'Get Hired as a Service Personnel',
                      content:
                          'Sign in to your dashboard as a service personel and get daily pickup tasks posted by the waste manager.',
                      image: '1',
                      imageWidth: 0.8,
                      imageHeight: 0.25,
                      imageTop: height(context) * 0.3)
                  : index == 1
                      ? OnBoardingWidget(
                          painter: OnboardingCurve2(),
                          header: 'Continue as Home Residents',
                          image: '2',
                          content:
                              'Get the opportunity to request for garbage pick-up in your homes, offices and environment as a Home resident.',
                          imageWidth: 0.9,
                          imageHeight: 0.35,
                          imageTop: height(context) * 0.25)
                      : OnBoardingWidget(
                          painter: OnboardingCurve3(),
                          header: 'Sign up to your Niche ',
                          image: '3',
                          imageWidth: 0.5,
                          content:
                              'Choose the dashboard that suits your needs, either as a service personel or as a home resident.',
                          imageHeight: 0.35,
                          imageTop: height(context) * 0.25);
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                controller.jumpToPage(index);
              },
              height: height(context),
              viewportFraction: 1,
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              autoPlay: true,
            ),
          ),
          SizedBox(
            height: 0,
            child: PageView(
              controller: controller,
              children: const [SizedBox(), SizedBox(), SizedBox()],
            ),
          ),
          Positioned(
              top: height(context) * 0.075,
              child: Column(
                children: [
                  SizedBox(height: height(context) * 0.1),
                  SizedBox(
                      width: width(context) * 0.12,
                      height: height(context) * 0.06,
                      child:
                          Image.asset('assets/images/pickaboo_alt_logo.png')),
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
