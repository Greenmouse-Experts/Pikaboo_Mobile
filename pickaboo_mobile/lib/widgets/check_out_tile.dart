import 'package:flutter/material.dart';

import '../data/models/models.dart';
import '../utilities/utilities.dart';

class CheckoutTile extends StatelessWidget {
  final CartSchema cartItem;
  const CheckoutTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: height(context) * 0.01),
        elevation: 0.5,
        color: AppColors.fadeGreen2,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height(context) * 0.015, horizontal: 8),
          child: Row(
            children: [
              SizedBox(
                width: width(context) * 0.4,
                child: Text(
                  cartItem.product?.name ?? '',
                  style: semi18(context).copyWith(color: AppColors.darkGreen),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.centerRight,
                width: width(context) * 0.15,
                child: Text(
                  'Qty: ${cartItem.quantity}',
                  style: regular15(context).copyWith(color: AppColors.altBlack),
                ),
              ),
              SizedBox(width: width(context) * 0.02),
              SizedBox(
                  width: width(context) * 0.3,
                  child: Center(
                      child: Text(
                    'NGN ${cartItem.price}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        regular15(context).copyWith(color: AppColors.altBlack),
                  )))
            ],
          ),
        ));
  }
}
