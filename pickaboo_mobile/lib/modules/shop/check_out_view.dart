import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../controllers/cart/cart_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class CheckoutView extends ConsumerStatefulWidget {
  const CheckoutView({super.key});

  @override
  ConsumerState<CheckoutView> createState() => _CheckoutViewConsumerState();
}

class _CheckoutViewConsumerState extends ConsumerState<CheckoutView> {
  final List<String> addressTypes = ['My Address', 'Custom Address'];
  var addressType = 'My Address';
  String? address = '';

  final _address = TextEditingController();

  void selectAddressType(String newPlan) {
    setState(() {
      addressType = newPlan;
    });
  }

  void _checkout() {
    if (addressType != 'My Address') {
      if (_address.text.isEmpty) {
        AppOverlays.showErrorSnackBar(
            context: context,
            message: 'Input a delivery address for this order');
        return;
      }
    }
    final homeOwner = ref.watch(authProvider).user;
    final address = homeOwner?.address ?? '';
    if (addressType == 'My Address') {
      if (address.isEmpty) {
        AppOverlays.showErrorSnackBar(
            context: context,
            message:
                "You can't check out with this method as you don't have an address currently");
        return;
      }
    }

    AppOverlays.showConfirmDialog(
        context: context,
        ref: ref,
        confirmAction: () {
          context.pop();
          ref.read(cartProvider.notifier).checkOut(
              ref: ref,
              context: context,
              address: addressType == 'My Address' ? address : _address.text);
        },
        cancelText: 'Cancel',
        confirmText: 'Purchase',
        message:
            'Are you sure you want to purchase this order, the balance will be deducted from your wallet');
  }

  void addressTextListener() {
    setState(() {
      address = _address.value.text;
    });
  }

  @override
  void initState() {
    super.initState();
    final homeOwner = ref.read(authProvider).user;
    address = homeOwner?.address;
    _address.addListener(addressTextListener);
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider).cart;
    print(address);
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: Column(
            children: [
              const PageHeader(title: 'Order Summary', hasSearch: false),
              SizedBox(height: height(context) * 0.01),
              SizedBox(
                height: height(context) * 0.3,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, i) {
                      return CheckoutTile(
                        cartItem: cartItems[i],
                      );
                    }),
              ),
              const Divider(color: AppColors.altAsh),
              SizedBox(height: height(context) * 0.01),
              DropDownPicker(
                label: 'Delivery Address',
                hasHeader: true,
                hint: 'Select Address',
                value: addressType,
                items: addressTypes.map((String plan) {
                  return DropdownMenuItem(
                    value: plan,
                    child: Text(
                      plan,
                      style: regular14(context),
                    ),
                  );
                }).toList(),
                onChanged: selectAddressType,
              ),
              SizedBox(height: height(context) * 0.01),
              addressType == 'My Address'
                  ? RowTitle2(title: 'Address', content: address ?? '')
                  : EditableTextField(
                      controller: _address,
                      keyboardType: TextInputType.streetAddress,
                      label: 'Custom Address',
                      isEditable: true,
                    ),
              SizedBox(height: height(context) * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:',
                      style: regular14(context)
                          .copyWith(color: Colors.black.withOpacity(0.4))),
                  Text(
                      'NGN ${ref.watch(cartProvider).cartTotal.toString().formatWithCommas}',
                      style: medium15(context))
                ],
              ),
              SizedBox(height: height(context) * 0.05),
              AppButton(
                  text: 'Purchase',
                  onPressed: (address ?? '').isNotEmpty ||
                          _address.value.text.isNotEmpty
                      ? _checkout
                      : null),
            ],
          ),
        )),
      ),
    );
  }
}
