import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class RequestPickupView extends StatefulWidget {
  final bool isSpecialRequest;
  const RequestPickupView({super.key, required this.isSpecialRequest});

  @override
  State<RequestPickupView> createState() => _RequestPickupViewState();
}

class _RequestPickupViewState extends State<RequestPickupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false, actions: [
        CircleAvatar(
          radius: width(context) * 0.04,
          backgroundColor: AppColors.lightAsh,
          child: Image.asset('assets/images/dummy_icon.png', fit: BoxFit.cover),
        ),
        SizedBox(width: width(context) * 0.04)
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: Column(
            children: [
              SizedBox(width: width(context)),
              Text('Request Waste Pickup',
                  style: semi18(context).copyWith(color: AppColors.primary)),
              SizedBox(height: height(context) * 0.01),
              Text(
                  'Kindly fill in the form to request for waste pickup in your area',
                  style: medium14(context)
                      .copyWith(color: Colors.black.withOpacity(0.4))),
              SizedBox(height: height(context) * 0.025),
              AppTextField2(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  label: 'Full Name',
                  hintText: ''),
              SizedBox(height: height(context) * 0.015),
              AppTextField2(
                  controller: numberController,
                  keyboardType: TextInputType.name,
                  label: 'Phone Number',
                  hintText: ''),
              SizedBox(height: height(context) * 0.015),
              widget.isSpecialRequest
                  ? DateTextField(
                      label: 'Pick Up Date',
                      hintText: '',
                      controller: dateController)
                  : const SizedBox(),
              widget.isSpecialRequest
                  ? SizedBox(height: height(context) * 0.015)
                  : const SizedBox(),
              const DropDownTextField(
                  label: 'Pick Up Area', hintText: 'Select available area'),
              SizedBox(height: height(context) * 0.015),
              AppTextField2(
                  controller: addressController,
                  keyboardType: TextInputType.streetAddress,
                  label: 'Pickup Address',
                  hintText: ''),
              SizedBox(height: height(context) * 0.03),
              Text(
                  'NB : Pika Boo would process your request before it is been accepted.',
                  style: regular14(context)
                      .copyWith(color: Colors.black.withOpacity(0.4))),
              Row(
                children: [
                  Consumer(builder: (context, ref, child) {
                    final remember = ref.watch(agreeNotifier);
                    return Checkbox.adaptive(
                        activeColor: AppColors.primary,
                        value: remember,
                        onChanged: (newval) {
                          ref.read(agreeNotifier.notifier).switchState();
                        });
                  }),
                  Text('I agree',
                      style:
                          medium14(context).copyWith(color: AppColors.primary))
                ],
              ),
              SizedBox(height: height(context) * 0.025),
              AppButton(
                  text: 'Submit',
                  onPressed: () {
                    AppOverlays.showSuccessDialog(
                        context: context,
                        content:
                            'Your request has been received, you will be notified when your pickup is ready.'
                            );
                  })
            ],
          ),
        )),
      ),
    );
  }
}

final agreeNotifier = NotifierProvider<AgreeNotifier, bool>(AgreeNotifier.new);

class AgreeNotifier extends Notifier<bool> {
  @override
  build() {
    return true;
  }

  void switchState() {
    state = !state;
  }
}
