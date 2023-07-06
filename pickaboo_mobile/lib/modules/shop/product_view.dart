import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badge;
import 'package:go_router/go_router.dart';

import '../../controllers/cart/cart_controller.dart';
import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class ProductView extends StatelessWidget {
  final String product;
  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final prod = ProductsSchema.fromRawJson(product);
    final images = prod.images ?? [];
    final price = prod.price ?? '0';
    final image = prod.images == null || prod.images!.isEmpty
        ? 'https://res.cloudinary.com/greenmouse-tech/image/upload/v1688402669/pikaboo/pickaboo_logo_eatts5.png'
        : prod.images![0];

    int quantity = 1;

    int stock = int.parse(prod.stock ?? '0');

    return Scaffold(
      appBar: customAppBar3(context,
          bgColor: AppColors.fadeGreen,
          hasElevation: false,
          actions: [
            Consumer(builder: (context, ref, _) {
              return IconButton(
                  onPressed: () => context.pushNamed(AppRouter.cartView),
                  icon: badge.Badge(
                    badgeContent: Text(
                        '${ref.watch(cartProvider).localCart.length}',
                        style:
                            regular14(context).copyWith(color: Colors.white)),
                    child: Icon(
                      Icons.shopping_cart_checkout,
                      color: AppColors.primary,
                      size: isMobile(context)
                          ? width(context) * 0.06
                          : width(context) * 0.045,
                    ),
                  ));
            }),
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
                      Text(prod.name ?? '', style: semi20(context)),
                      const Spacer(),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: height(context) * 0.07,
                    width: width(context),
                    child: Text(prod.description ?? 'Very wonderful product',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: medium13(context)
                            .copyWith(color: Colors.black.withOpacity(0.4))),
                  ),
                  images.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          height: width(context) * 0.33,
                          child: ListView.builder(
                              itemCount: images.length,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) => Padding(
                                    padding: EdgeInsets.only(
                                        right: width(context) * 0.02),
                                    child: ProductImage(
                                      image: images[i],
                                    ),
                                  )),
                        ),
                  StatefulBuilder(builder: (context, setStater) {
                    return Row(children: [
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
                        width: width(context) * 0.32,
                        height: height(context) * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.lightAsh),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity == 1) {
                                  AppOverlays.showErrorSnackBar(
                                      context: context,
                                      message: "You can't order less than one");
                                  return;
                                }
                                setStater(() {
                                  quantity--;
                                });
                              },
                              icon: Icon(Icons.remove,
                                  size: width(context) * 0.06),
                            ),
                            Text('$quantity', style: medium16(context)),
                            IconButton(
                                onPressed: () {
                                  if (quantity == stock) {
                                    AppOverlays.showErrorSnackBar(
                                        context: context,
                                        message:
                                            "You can't order more than the available stock");
                                    return;
                                  }
                                  setStater(() {
                                    quantity++;
                                  });
                                },
                                icon: Icon(Icons.add,
                                    size: width(context) * 0.06)),
                          ],
                        ),
                      )
                    ]);
                  }),
                  Row(children: [
                    Text('NGN ${price.formatWithCommas}',
                        style: semi20(context)),
                    const Spacer(),
                    Text('Stock', style: medium13(context)),
                    SizedBox(width: width(context) * 0.01),
                    Container(
                      width: width(context) * 0.18,
                      height: height(context) * 0.025,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.lightAsh),
                      child: Text('$stock', style: medium14(context)),
                    )
                  ]),
                  Consumer(builder: (context, ref, _) {
                    final cartWatcher = ref.watch(cartProvider).localCart;

                    final isInCart = cartWatcher.contains(prod.id.toString());

                    return ref.watch(cartProvider).isButtonLoading
                        ? const Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
                        : AppButton(
                            text: isInCart ? 'Proceed to cart' : 'Add to Cart',
                            onPressed: isInCart
                                ? () => context.pushNamed(AppRouter.cartView)
                                : () {
                                    ref.read(cartProvider.notifier).addToCart(
                                        context: context,
                                        ref: ref,
                                        productId: prod.id.toString(),
                                        quantity: quantity.toString());
                                  },
                            buttonHeight: 0.06);
                  })
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
