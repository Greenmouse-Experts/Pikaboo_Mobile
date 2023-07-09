import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/cart/cart_controller.dart';
import '../data/models/models.dart';
import '../utilities/utilities.dart';
import 'widgets.dart';

class CartCard extends ConsumerStatefulWidget {
  final CartSchema cartItem;
  const CartCard({super.key, required this.cartItem});

  @override
  ConsumerState<CartCard> createState() => _CartCardConsumerState();
}

class _CartCardConsumerState extends ConsumerState<CartCard> {
  bool isLoading = false;

  void reduceCount() async {
    int quantity = int.parse(widget.cartItem.quantity ?? '0');
    if (quantity <= 1) {
      AppOverlays.showErrorSnackBar(
          context: context, message: "You can't order less than one");
      return;
    }
    quantity = quantity - 1;
    int price = int.parse(
            widget.cartItem.product?.price?.replaceAll(RegExp(r'[^0-9]'), '') ??
                '0') *
        quantity;

    setState(() {
      isLoading = true;
    });

    await ref.read(cartProvider.notifier).updateCart(
        context: context,
        ref: ref,
        cartId: widget.cartItem.id!,
        price: price.toString(),
        quantity: quantity.toString());

    setState(() {
      isLoading = false;
    });
  }

  void increaseCount() async {
    int quantity = int.parse(widget.cartItem.quantity ?? '0');
    int stock = int.parse(widget.cartItem.product?.stock ?? '0');
    if (quantity >= stock) {
      AppOverlays.showErrorSnackBar(
          context: context,
          message: "You can't order more than stock available");
      return;
    }
    quantity = quantity + 1;
    int price = int.parse(
            widget.cartItem.product?.price?.replaceAll(RegExp(r'[^0-9]'), '') ??
                '0') *
        quantity;

    setState(() {
      isLoading = true;
    });

    await ref.read(cartProvider.notifier).updateCart(
        context: context,
        ref: ref,
        cartId: widget.cartItem.id!,
        price: price.toString(),
        quantity: quantity.toString());

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height(context) * 0.01),
      padding: EdgeInsets.symmetric(
          vertical: height(context) * 0.01, horizontal: width(context) * 0.02),
      decoration: BoxDecoration(
          color: AppColors.fadeGreen2, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          SizedBox(
            width: width(context) * 0.24,
            height: width(context) * 0.24,
            child: Padding(
              padding: EdgeInsets.all(width(context) * 0.01),
              child: CachedNetworkImage(
                  imageUrl:
                      'https://res.cloudinary.com/greenmouse-tech/image/upload/v1688402669/pikaboo/pickaboo_logo_eatts5.png',
                  errorWidget: (context, url, error) {
                    return Image.asset('assets/images/pickaboo_logo.png');
                  },
                  progressIndicatorBuilder: (context, url, progress) => Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primary),
                        ),
                      )),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width(context) * 0.3,
                child: Text(
                  widget.cartItem.product?.name ?? '',
                  style: medium14(context),
                ),
              ),
              SizedBox(height: height(context) * 0.01),
              OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      side: const BorderSide(color: AppColors.primary),
                      fixedSize:
                          Size(width(context) * 0.3, height(context) * 0.06)),
                  child: Text(
                    'NGN ${widget.cartItem.price ?? '0'}',
                    style: regular12(context),
                  )),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  AppOverlays.showConfirmDialog(
                      context: context,
                      ref: ref,
                      confirmColor: Colors.red,
                      message:
                          'Are you sure you want to remove this item from cart',
                      confirmAction: () async {
                        context.pop();
                        ref.read(cartProvider.notifier).removeCartItem(
                            ref: ref,
                            context: context,
                            id: widget.cartItem.id!);
                      });
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: reduceCount,
                    child: Container(
                        alignment: Alignment.center,
                        width: width(context) * 0.08,
                        height: height(context) * 0.08,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            shape: BoxShape.circle),
                        child: Icon(Icons.remove,
                            size: width(context) * 0.06,
                            color: AppColors.primary)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) * 0.02),
                    child: isLoading
                        ? SizedBox(
                            width: width(context) * 0.05,
                            height: width(context) * 0.05,
                            child: const CircularProgressIndicator.adaptive(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.primary),
                            ),
                          )
                        : Text(widget.cartItem.quantity ?? '',
                            style: medium14(context)),
                  ),
                  InkWell(
                    onTap: increaseCount,
                    child: Container(
                        alignment: Alignment.center,
                        width: width(context) * 0.08,
                        height: height(context) * 0.08,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            shape: BoxShape.circle),
                        child: Icon(Icons.add,
                            size: width(context) * 0.06,
                            color: AppColors.primary)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
