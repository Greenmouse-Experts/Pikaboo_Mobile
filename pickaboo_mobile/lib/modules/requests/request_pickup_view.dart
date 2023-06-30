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
              const DoubleTitle(
                  leadingTitle: 'Special Request',
                  leadingContent: '5 min',
                  trailingTitle: 'N2000',
                  trailingContent: 'Zonal Price per bin',
                  hasBackground: true),
              const DoubleTitle(
                  leadingTitle: 'Waste Address',
                  leadingContent: 'Akuku/Ewan',
                  trailingTitle: '',
                  trailingContent: '',
                  hasBackground: false),
              const DoubleTitle(
                  leadingTitle: 'Estimated Time',
                  leadingContent: '1hr 10min',
                  trailingTitle: '',
                  trailingContent: '',
                  hasBackground: false),
              const _DatePicker(),
              CustomDoubleTitle(
                  leadingTitle: 'Waste bins',
                  leadingContent: 'Number of waste bins.',
                  isLast: true,
                  customEnd: Row(
                    children: [
                      Text('Quantity', style: medium13(context)),
                      SizedBox(width: width(context) * 0.01),
                      Container(
                        width: width(context) * 0.18,
                        height: height(context) * 0.025,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.lightAsh),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.remove, size: width(context) * 0.04),
                            Text('1', style: medium13(context)),
                            Icon(Icons.add, size: width(context) * 0.04),
                          ],
                        ),
                      )
                    ],
                  )),
              const DoubleTitle(
                  leadingTitle: 'Total Price',
                  leadingContent: '',
                  trailingTitle: 'N4000',
                  trailingContent: 'Total Price for 2 bins',
                  hasBackground: true),
              SizedBox(height: height(context) * 0.04),
              AppButton(
                  text: 'Proceed',
                  onPressed: () {
                    AppOverlays.showSuccessDialog(
                        context: context,
                        content:
                            'Your request has been received, you will be notified when your pickup is ready.');
                  })
            ],
          ),
        )),
      ),
    );
  }
}

class _DatePicker extends StatefulWidget {
  const _DatePicker();

  @override
  State<_DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<_DatePicker> {
  TextEditingController dateController = TextEditingController();
  void selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primary,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(),
              ),
            ),
            child: child!,
          );
        });
    if (selectedDate != null) {
      setState(() {
        dateController.text = selectedDate.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomDoubleTitle(
      leadingTitle: 'Date',
      leadingContent: dateController.text.isEmpty
          ? 'Expected pickup date'
          : dateController.text,
      customEnd: IconButton(
          onPressed: selectDate,
          icon: Icon(
            Icons.calendar_today_outlined,
            size: isMobile(context)
                ? width(context) * 0.06
                : width(context) * 0.04,
          )),
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


   // Text('Request Waste Pickup',
              //     style: semi18(context).copyWith(color: AppColors.primary)),
              // SizedBox(height: height(context) * 0.01),
              // Text(
              //     'Kindly fill in the form to request for waste pickup in your area',
              //     style: medium14(context)
              //         .copyWith(color: Colors.black.withOpacity(0.4))),
              // SizedBox(height: height(context) * 0.025),
              // AppTextField2(
              //     controller: nameController,
              //     keyboardType: TextInputType.name,
              //     label: 'Full Name',
              //     hintText: ''),
              // SizedBox(height: height(context) * 0.015),
              // AppTextField2(
              //     controller: numberController,
              //     keyboardType: TextInputType.name,
              //     label: 'Phone Number',
              //     hintText: ''),
              // SizedBox(height: height(context) * 0.015),
              // widget.isSpecialRequest
              //     ? DateTextField(
              //         label: 'Pick Up Date',
              //         hintText: '',
              //         controller: dateController)
              //     : const SizedBox(),
              // widget.isSpecialRequest
              //     ? SizedBox(height: height(context) * 0.015)
              //     : const SizedBox(),
              // const DropDownTextField(
              //     label: 'Pick Up Area', hintText: 'Select available area'),
              // SizedBox(height: height(context) * 0.015),
              // AppTextField2(
              //     controller: addressController,
              //     keyboardType: TextInputType.streetAddress,
              //     label: 'Pickup Address',
              //     hintText: ''),
              // SizedBox(height: height(context) * 0.03),
              // Text(
              //     'NB : Pika Boo would process your request before it is been accepted.',
              //     style: regular14(context)
              //         .copyWith(color: Colors.black.withOpacity(0.4))),
              // Row(
              //   children: [
              //     Consumer(builder: (context, ref, child) {
              //       final remember = ref.watch(agreeNotifier);
              //       return Checkbox.adaptive(
              //           activeColor: AppColors.primary,
              //           value: remember,
              //           onChanged: (newval) {
              //             ref.read(agreeNotifier.notifier).switchState();
              //           });
              //     }),
              //     Text('I agree',
              //         style:
              //             medium14(context).copyWith(color: AppColors.primary))
              //   ],
              // ),