import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:go_router/go_router.dart';

import '../utilities/utilities.dart';
import 'widgets.dart';

class CheckoutModal extends StatefulWidget {
  const CheckoutModal({super.key});

  @override
  State<CheckoutModal> createState() => _CheckoutModalState();
}

class _CheckoutModalState extends State<CheckoutModal> {
  // final plugin = PaystackPlugin();
  // final publicKey = Constants.paystackPublicKey;

  @override
  void initState() {
    super.initState();
    // plugin.initialize(publicKey: publicKey);
  }

  void checkout() async {
    // Charge charge = Charge()
    //   ..amount = 600000
    //   ..reference = 'TR-${DateTime.now().millisecondsSinceEpoch}'
    //   ..email = 'greenmouseapp@gmail.com'
    //   ..currency = "NGN";

    // plugin
    //     .checkout(context,
    //         method: CheckoutMethod.card, charge: charge, fullscreen: true)
    //     .then((value) {
    //   if (value.status == true) {
    //     context.pop();
    //     context.pushNamed(AppRouter.fundStatus);
    //   } else {}
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: screenPadding(context),
        child: Column(
          children: [
            SizedBox(width: width(context)),
            Row(
              children: [
                const Spacer(),
                Text(
                  'Checkout',
                  style: semi23(context),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: isMobile(context)
                          ? width(context) * 0.06
                          : width(context) * 0.045,
                    )),
              ],
            ),
            SizedBox(height: height(context) * 0.01),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(width: 0.25, color: const Color(0xFF007004))),
              child: ListTile(
                leading: Icon(Icons.location_on,
                    size: isMobile(context)
                        ? width(context) * 0.08
                        : width(context) * 0.055,
                    color: Colors.black),
                title: Text('Delivery Address', style: medium16(context)),
                subtitle: Text('Richard Moore estate, Victoria island.',
                    style: regular13(context)
                        .copyWith(color: Colors.black.withOpacity(0.4))),
                trailing: IconButton(
                    onPressed: () {
                      context.pushNamed(AppRouter.addressView);
                    },
                    icon: Icon(
                      Icons.mode_edit_outline_sharp,
                      color: Colors.black,
                      size: isMobile(context)
                          ? width(context) * 0.05
                          : width(context) * 0.04,
                    )),
              ),
            ),
            SizedBox(height: height(context) * 0.02),
            const RowTitle2(title: 'Subtotal', content: '₦ 6,000.00'),
            const RowTitle2(title: 'Shipping Fee', content: '₦ 0.00'),
            SizedBox(height: height(context) * 0.03),
            DottedLine(dashColor: Colors.black.withOpacity(0.4)),
            SizedBox(height: height(context) * 0.03),
            const RowTitle2(title: 'Total', content: '₦ 6,000.00'),
            SizedBox(height: height(context) * 0.05),
            AppButton(
                text: 'Pay Now',
                onPressed: () {
                  checkout();
                })
          ],
        ),
      ),
    );
  }
}
