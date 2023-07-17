import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/cart/cart_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(
        context,
        hasElevation: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: screenPadding(context),
        child: Consumer(builder: (context, ref, _) {
          final getCart = ref.watch(cartProvider).viewCart(ref: ref);
          return Center(
            child: FutureBuilder(
                future: getCart,
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
                    final cartItems = ref.watch(cartProvider).cart;
                    return Column(
                      children: [
                        const PageHeader(
                            title: 'Shopping Cart', hasSearch: false),
                        SizedBox(
                          height: height(context) * 0.6,
                          child: cartItems.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('You currently have no items in cart',
                                        style: medium16(context),
                                        textAlign: TextAlign.center),
                                    SizedBox(height: height(context) * 0.02),
                                    AppButton(
                                        text: 'Proceed to Shop',
                                        buttonWidth: 0.5,
                                        onPressed: () {
                                          context.pop();
                                        })
                                  ],
                                )
                              : ListView.builder(
                                  itemCount: cartItems.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    return CartCard(cartItem: cartItems[i]);
                                  }),
                        ),
                        const Divider(
                          color: AppColors.altAsh,
                        ),
                        SizedBox(height: height(context) * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('SubTotal:',
                                style: regular14(context).copyWith(
                                    color: Colors.black.withOpacity(0.4))),
                            Text(
                                'NGN ${ref.watch(cartProvider).cartTotal.toString().formatWithCommas}',
                                style: medium15(context))
                          ],
                        ),
                        const Spacer(),
                        cartItems.isEmpty
                            ? const SizedBox()
                            : AppButton(
                                text: 'Proceed to Checkout',
                                onPressed: () =>
                                    context.pushNamed(AppRouter.checkoutView)),
                        SizedBox(height: height(context) * 0.01),
                      ],
                    );
                  }
                }),
          );
        }),
      )),
    );
  }
}
