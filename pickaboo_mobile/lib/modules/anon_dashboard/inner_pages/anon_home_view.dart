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
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        const AppImage(
                            image: 'assets/images/truck.png',
                            imageHeight: 0.16 ,
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
                SizedBox(height: height(context) * 0.01),
                Container(
                  height: height(context) * 0.2,
                  width: width(context),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/patterns.png'))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: width(context) * 0.635,
                          child: Text('Clean Environment,\nClean Life.',
                              textAlign: TextAlign.center,
                              style: semi20(context)
                                  .copyWith(color: Colors.white))),
                      SizedBox(
                        width: width(context) * 0.635,
                        child: Text(
                          'Book garbage collectors at the comfort of your home.',
                          textAlign: TextAlign.center,
                          style: medium13(context)
                              .copyWith(color: Colors.white.withOpacity(0.7)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: adjustedHeight(context) * 0.02),
                Text(
                  'Get Started with PIKABOO',
                  style: medium16(context),
                ),
                SizedBox(height: adjustedHeight(context) * 0.02),
                Row(
                  children: [
                    AppButton(
                      text: 'FAQs',
                      onPressed: () {},
                      buttonWidth: 0.23,
                      buttonHeight: 0.05,
                    ),
                    const SizedBox(width: 10),
                    AppButton(
                      text: 'Terms  & Conditions',
                      onPressed: () {},
                      buttonColor: AppColors.orange,
                      buttonWidth: 0.4,
                      buttonHeight: 0.05,
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Column(
                    //     children: [
                    //       Text('Terms & Conditions',
                    //           style: medium14(context)
                    //               .copyWith(color: AppColors.primary)),
                    //       const SizedBox(height: 1),
                    //       Container(
                    //           width: width(context) * 0.33,
                    //           height: 1,
                    //           color: AppColors.primary)
                    //     ],
                    //   ),
                    // )
                  ],
                ),
                SizedBox(height: adjustedHeight(context) * 0.04),
                Text('What we Do!', style: medium16(context)),
                SizedBox(height: adjustedHeight(context) * 0.02),
                Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            child: DetailCard(
                                header: 'Waste Pickup',
                                content: 'Lorem Ipsum')),
                        SizedBox(width: width(context) * 0.025),
                        const Expanded(
                            child: DetailCard(
                                header: 'In-app Sales', content: 'Lorem Ipsum'))
                      ],
                    ),
                    SizedBox(height: adjustedHeight(context) * 0.01),
                    Row(
                      children: [
                        const Expanded(
                            child: DetailCard(
                                header: 'Pickup Request',
                                content: 'Lorem Ipsum')),
                        SizedBox(width: width(context) * 0.025),
                        const Expanded(
                            child: DetailCard(
                                header: 'Timely Delivery',
                                content: 'Lorem Ipsum'))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: adjustedHeight(context) * 0.015),
                Text('Users Sign In', style: medium16(context)),
                SizedBox(height: adjustedHeight(context) * 0.015),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                          onPressed: () => context.pushNamed(AppRouter.login,
                              pathParameters: {'type': 'user'}),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary),
                          icon: Icon(Icons.house_outlined,
                              size: width(context) * 0.05),
                          label: Text('Household User',
                              style: medium14(context)
                                  .copyWith(color: Colors.white))),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                          onPressed: () => context.pushNamed(AppRouter.login,
                              pathParameters: {'type': 'driver'}),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary),
                          icon: SizedBox(
                              width: width(context) * 0.06,
                              height: width(context) * 0.06,
                              child: Image.asset(
                                  'assets/images/icons/steering.png')),
                          label: Text('Household User',
                              style: medium14(context)
                                  .copyWith(color: Colors.white))),
                    ],
                  ),
                )

                // Row(
                //   children: [
                //     SignUpPreview(
                //       image: 'house',
                //       header: 'House hold User',
                //       onPressed: () => context.pushNamed(AppRouter.login,
                //           pathParameters: {'type': 'user'}),
                //     ),
                //     const Spacer(),
                //     SignUpPreview(
                //         image: 'driver',
                //         header: 'Waste Truck Driver',
                //         onPressed: () => context.pushNamed(AppRouter.login,
                //             pathParameters: {'type': 'driver'})),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
