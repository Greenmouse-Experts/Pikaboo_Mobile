import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar3(context,
          bgColor: AppColors.fadeGreen, hasElevation: false),
      body: SafeArea(
          child: Container(
        color: AppColors.fadeGreen,
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: height(context) * 0.05),
                Image.asset('assets/images/dummy_prod.png'),
                SizedBox(height: height(context) * 0.05),
              ],
            ),
            Expanded(
                child: Container(
              padding: screenPadding(context),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: height(context) * 0.035, width: width(context)),
                  Text('Green Container', style: semi20(context)),
                  SizedBox(height: height(context) * 0.01),
                  Text(
                      'Limited to food waste, yard waste, green waste, other organic materials.',
                      style: medium13(context)
                          .copyWith(color: Colors.black.withOpacity(0.4))),
                  SizedBox(height: height(context) * 0.01),
                  SizedBox(
                    height: width(context) * 0.33,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) => Padding(
                              padding:
                                  EdgeInsets.only(right: width(context) * 0.02),
                              child: const ProductImage(),
                            )),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  Row(children: [
                    Text('NGN 6,000', style: semi20(context)),
                    const Spacer(),
                    Container(
                      width: width(context) * 0.15,
                      height: height(context) * 0.025,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.lightAsh),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star,
                              color: AppColors.gold,
                              size: width(context) * 0.04),
                          Text('4.5', style: medium13(context))
                        ],
                      ),
                    )
                  ]),
                  const Spacer(),
                  AppButton(text: 'Buy', onPressed: () {}, buttonHeight: 0.06)
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
