import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  final TextEditingController _oldAddress = TextEditingController();
  final TextEditingController _newAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _oldAddress.text = 'Akuku Ewan';
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
