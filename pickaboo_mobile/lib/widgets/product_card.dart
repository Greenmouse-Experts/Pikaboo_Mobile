import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utilities/utilities.dart';
import 'app_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: () => context.pushNamed(AppRouter.productPage),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const ProductImage(),
                SizedBox(width: width(context) * 0.04),
                Expanded(
                  child: SizedBox(
                    height: width(context) * 0.35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Green Container', style: medium13(context)),
                        Text(
                            'Limited to food waste, green waste, other organic materials.',
                            style: regular11(context).copyWith(
                                color: Colors.black.withOpacity(0.4))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('NGN 6,000', style: medium13(context)),
                            AppButton(
                              text: 'Buy',
                              onPressed: () {},
                              buttonWidth: 0.16,
                              buttonHeight: 0.035,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.32,
      height: width(context) * 0.35,
      color: AppColors.fadeGreen,
      child: Padding(
        padding: EdgeInsets.all(width(context) * 0.01),
        child: Image.asset('assets/images/dummy_prod.png'),
      ),
    );
  }
}
