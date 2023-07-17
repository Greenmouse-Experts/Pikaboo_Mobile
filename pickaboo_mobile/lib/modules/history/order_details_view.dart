import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/orders/order_controller.dart';
import '../../data/models/single_order_schema.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class OrderDetailsView extends ConsumerWidget {
  final String id;
  const OrderDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false),
      body: SafeArea(
          child: Padding(
        padding: screenPadding(context),
        child: FutureBuilder<SingleOrderSchema>(
            future: ref.watch(orderProvider).viewSingleOrder(id: id, ref: ref),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const PageLoader();
              } else if (snapshot.hasError) {
                return AppErrorWidget(
                    //snapshot.error!
                    widgetHeight: 0.7,
                    errorType: snapshot.error.runtimeType,
                    error: snapshot.error.toString());
              } else {
                final orderDetail = snapshot.data;
                if (orderDetail == null) {
                  return const Center(
                      child: Text('An Unknnown erroor occured'));
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageHeader(
                          title: 'Order Details', hasSearch: false),
                      SizedBox(height: height(context) * 0.015),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(orderDetail.data?.invoiceNumber ?? '',
                                  style: semi16(context)),
                              SizedBox(height: height(context) * 0.005),
                              Text(
                                  orderDetail.data?.createdAt?.formatedDate ??
                                      DateTime.now().formatedDate,
                                  style: regular15(context)
                                      .copyWith(color: Colors.black87)),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            orderDetail.data?.status ?? '',
                            style: medium15(context).copyWith(
                                color: orderDetail.data?.status == 'PENDING'
                                    ? Colors.orange
                                    : AppColors.primary),
                          )
                        ],
                      ),
                      SizedBox(height: height(context) * 0.015),
                      Text('Deliivered to:',
                          style: regular15(context)
                              .copyWith(color: Colors.black87)),
                      Text(orderDetail.data?.address ?? '',
                          style: semi16(context)),
                      OrderDetailTile(
                        name: orderDetail.data?.product?.name ?? '',
                        price: orderDetail.data?.product?.price ?? '',
                        quantiity: orderDetail.data?.quantity ?? '',
                      ),
                      const Divider(),
                      RowTitle2(
                          title: 'SubTotal',
                          content:
                              'NGN ${orderDetail.data?.totalPrice ?? '0'}'),
                      const RowTitle2(title: 'Delivery', content: 'NGN 0.00'),
                      RowTitle2(
                          title: 'Total',
                          content:
                              'NGN ${orderDetail.data?.totalPrice ?? '0'}'),
                    ],
                  );
                }
              }
            }),
      )),
    );
  }
}
