import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/check_out_modal.dart';
import '../../widgets/widgets.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    void showCheckOut() {
      showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          context: context,
          builder: (context) {
            return const CheckoutModal();
          });
    }

    return Scaffold(
      appBar: customAppBar3(context,
          bgColor: AppColors.fadeGreen,
          hasElevation: false,
          actions: [
            CircleAvatar(
              radius: width(context) * 0.04,
              backgroundColor: AppColors.lightAsh,
              child: Image.asset('assets/images/dummy_icon.png',
                  fit: BoxFit.cover),
            ),
            SizedBox(width: width(context) * 0.04)
          ]),
      body: SafeArea(
          child: Container(
        color: AppColors.fadeGreen,
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: height(context) * 0.04),
                Image.asset('assets/images/dummy_prod.png'),
                SizedBox(height: height(context) * 0.04),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Green Container', style: semi20(context)),
                      const Spacer(),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.bookmark_outline_outlined,
                            color: Colors.black,
                            size: width(context) * 0.05,
                          ),
                          label: Text(
                            'Save',
                            style: regular13(context),
                          )),
                    ],
                  ),
                  Text(
                      'Limited to food waste, yard waste, green waste, other organic materials.',
                      style: medium13(context)
                          .copyWith(color: Colors.black.withOpacity(0.4))),
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
                  Row(children: [
                    Text('Color', style: medium13(context)),
                    SizedBox(width: width(context) * 0.05),
                    CircleAvatar(
                        radius: width(context) * 0.01,
                        backgroundColor: AppColors.primary),
                    SizedBox(width: width(context) * 0.02),
                    CircleAvatar(
                        radius: width(context) * 0.01,
                        backgroundColor: Colors.black),
                    const Spacer(),
                    Text('Quantity', style: medium13(context)),
                    SizedBox(width: width(context) * 0.01),
                    Container(
                      width: width(context) * 0.18,
                      height: height(context) * 0.025,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.lightAsh),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.remove, size: width(context) * 0.04),
                          Text('1', style: medium13(context)),
                          Icon(Icons.add, size: width(context) * 0.04),
                        ],
                      ),
                    )
                  ]),
                  Row(children: [
                    Text('NGN 6,000', style: semi20(context)),
                    const Spacer(),
                    Container(
                      width: width(context) * 0.18,
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
                          const SizedBox(width: 2),
                          Text('4.5', style: medium13(context))
                        ],
                      ),
                    )
                  ]),
                  AppButton(
                      text: 'Buy',
                      onPressed: () {
                        showCheckOut();
                      },
                      buttonHeight: 0.06)
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
