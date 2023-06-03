import 'package:flutter/material.dart';

import '../../../utilities/utilities.dart';
import '../../../widgets/widgets.dart';

class AnonHomeView extends StatelessWidget {
  const AnonHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, implyLeading: true),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: screenPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                SizedBox(height: height(context) * 0.01),
                Text(
                  'Get Started with PIKABOO',
                  style: medium16(context),
                ),
                SizedBox(height: height(context) * 0.01),
                Row(
                  children: [
                    AppButton(text: 'FAQ', onPressed: () {}, buttonWidth: 0.2),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Text('Terms & Conditions',
                              style: medium14(context)
                                  .copyWith(color: AppColors.primary)),
                          const SizedBox(height: 1),
                          Container(
                              width: width(context) * 0.33,
                              height: 1,
                              color: AppColors.primary)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: height(context) * 0.01),
                SizedBox(
                  height: height(context) * 0.1,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      OnBoardPrompt(),
                      SizedBox(width: 10),
                      OnBoardPrompt()
                    ],
                  ),
                ),
                SizedBox(height: height(context) * 0.01),
                const Row(
                  children: [
                    SignUpPreview(image: 'house', header: 'House hold User'),
                    Spacer(),
                    SignUpPreview(
                        image: 'driver', header: 'Waste Truck Driver'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
