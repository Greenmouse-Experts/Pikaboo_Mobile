import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/check_out_modal.dart';
import '../../widgets/widgets.dart';

class ProductView extends StatelessWidget {
  final String productId;
  const ProductView({super.key, required this.productId});

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

    final product = ProductsSchema.fromRawJson(productId);
    final images = product.images ?? [];
    final image = product.images == null || product.images!.isEmpty
        ? 'https://res.cloudinary.com/greenmouse-tech/image/upload/v1688402669/pikaboo/pickaboo_logo_eatts5.png'
        : product.images![0];

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
                SizedBox(
                  height: height(context) * 0.275,
                  width: width(context),
                  child: CachedNetworkImage(
                      imageUrl: image,
                      errorWidget: (context, url, error) {
                        return Image.asset('assets/images/pickaboo_logo.png');
                      },
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.primary),
                            ),
                          )),
                ),
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
                      Text(product.name ?? '', style: semi20(context)),
                      const Spacer(),
                    ],
                  ),
                  Text(product.description ?? '',
                      style: medium13(context)
                          .copyWith(color: Colors.black.withOpacity(0.4))),
                  images.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          height: width(context) * 0.33,
                          child: ListView.builder(
                              itemCount: images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) => Padding(
                                    padding: EdgeInsets.only(
                                        right: width(context) * 0.02),
                                    child: ProductImage(
                                      image: images[i],
                                    ),
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
