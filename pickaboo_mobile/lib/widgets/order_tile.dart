import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/models/order_schema.dart';
import '../utilities/utilities.dart';
import 'product_card.dart';

class OrderTile extends StatelessWidget {
  final OrderSchema order;
  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final initialDate = order.createdAt!;
    DateTime newDate = initialDate.add(const Duration(days: 7));
    return InkWell(
      onTap: () => context.pushNamed(AppRouter.oorderDetailsView,
          pathParameters: {'id': order.id.toString()}),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(vertical: height(context) * 0.01),
        child: Padding(
          padding: EdgeInsets.all(width(context) * 0.02),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Id: ${order.invoiceNumber}',
                      style: semi15(context)
                          .copyWith(color: Colors.black.withOpacity(0.7))),
                  const SizedBox(height: 2),
                  Text(order.createdAt!.formatedDate,
                      style: medium14(context).copyWith(color: Colors.grey)),
                  SizedBox(height: height(context) * 0.02),
                  Text('Estimated Delivery : ${newDate.regularDate}',
                      style: medium14(context).copyWith(
                        color: AppColors.darkGreen,
                      ))
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: width(context) * 0.12,
                    width: width(context) * 0.12,
                    // child: const ProductImage(
                    //     image: order.
                    //        'https://res.cloudinary.com/greenmouse-tech/image/upload/v1688402669/pikaboo/pickaboo_logo_eatts5.png'),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  Text(
                    '${order.totalPrice}',
                    style: regular14(context),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetailTile extends StatelessWidget {
  final String quantiity;
  final String name;
  final String price;
  final String image;
  const OrderDetailTile(
      {super.key,
      required this.quantiity,
      required this.name,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: height(context) * 0.01),
      leading: SizedBox(
        width: width(context) * 0.12,
        height: height(context) * 0.12,
        child: ProductImage(image: image),
      ),
      title: SizedBox(
          width: width(context) * 0.5,
          child: Text(name, style: medium16(context))),
      subtitle: Text(
        'Qty: $quantiity',
        style:
            regular14(context).copyWith(color: Colors.black.withOpacity(0.7)),
      ),
      trailing: Text(
        'NGN ${price.formatWithCommas}',
        style: medium16(context),
      ),
    );
  }
}
