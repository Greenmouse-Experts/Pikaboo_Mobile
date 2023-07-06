import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class AddressView extends ConsumerStatefulWidget {
  const AddressView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddressViewState();
}

class _AddressViewState extends ConsumerState<AddressView> {
  final TextEditingController _oldAddress = TextEditingController();
  final TextEditingController _newAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeOwner = ref.watch(authProvider).user;
    _oldAddress.text = homeOwner?.address ?? 'No Address yet';
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false),
      body: SafeArea(
          child: Padding(
        padding: screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(title: 'Change Your Address', hasSearch: false),
            SizedBox(height: height(context) * 0.02),
            Text(
              'Fill in your details below to change your current address',
              style: medium14(context)
                  .copyWith(color: Colors.black.withOpacity(0.4)),
            ),
            SizedBox(height: height(context) * 0.02),
            AppTextField2(
                label: 'Current Address',
                keyboardType: TextInputType.streetAddress,
                readOnly: true,
                controller: _oldAddress),
            SizedBox(height: height(context) * 0.02),
            AppTextField2(
                label: 'New Address',
                keyboardType: TextInputType.streetAddress,
                controller: _newAddress),
            SizedBox(height: height(context) * 0.1),
            AppButton(text: 'Save Changes', onPressed: () {}),
          ],
        ),
      )),
    );
  }
}
