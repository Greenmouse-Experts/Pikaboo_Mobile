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
  final TextEditingController _zone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeOwner = ref.watch(authProvider).user;
    _oldAddress.text = homeOwner?.address ?? 'No Address yet';
    _zone.text = homeOwner?.zone?.name ?? 'No Zone yet';
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false),
      body: SafeArea(
          child: Padding(
        padding: screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(title: 'Your Address', hasSearch: false),
            SizedBox(height: height(context) * 0.02),
            Text(
              'Below are details of your address and zone',
              style: medium14(context)
                  .copyWith(color: Colors.black.withOpacity(0.4)),
            ),
            SizedBox(height: height(context) * 0.02),
            EditableTextField(
              label: 'Address',
              controller: _oldAddress,
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(height: height(context) * 0.01),
            EditableTextField(
              label: 'Zone',
              controller: _zone,
              keyboardType: TextInputType.streetAddress,
            ),
          ],
        ),
      )),
    );
  }
}
