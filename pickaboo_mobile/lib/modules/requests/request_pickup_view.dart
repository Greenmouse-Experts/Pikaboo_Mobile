import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../controllers/special_requests.dart/special_request_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class RequestPickupView extends ConsumerStatefulWidget {
  final bool isSpecialRequest;
  const RequestPickupView({super.key, required this.isSpecialRequest});

  @override
  ConsumerState<RequestPickupView> createState() =>
      _RequestPickupViewConsumerState();
}

class _RequestPickupViewConsumerState extends ConsumerState<RequestPickupView> {
  final List<String> addressTypes = ['My Address', 'Custom Address'];
  var addressType = 'My Address';

  final _address = TextEditingController();
  final _date = TextEditingController();

  void selectAddressType(String newPlan) {
    setState(() {
      addressType = newPlan;
    });
  }

  void submitRequest() {
    final charge = ref.watch(specialProvider).charges;
    if (addressType == 'My Address') {
      if (_date.text.isEmpty) {
        AppOverlays.showErrorSnackBar(
            context: context, message: 'Select a  date');
        return;
      }
      final homeOwner = ref.watch(authProvider).user;
      final address = homeOwner?.address ?? '';
      if (address.isEmpty) {
        AppOverlays.showErrorSnackBar(
            context: context,
            message:
                "You can't request with this method as you don't have an address currently");
        return;
      }
      AppOverlays.showConfirmDialog(
          context: context,
          ref: ref,
          confirmAction: () {
            context.pop();
            ref.read(specialProvider.notifier).createSpecialRequest(
                context: context, ref: ref, date: _date.text);
          },
          message:
              'Creating this special request will lead to a deduction of NGN ${charge.formatWithCommas} from your wallet. \n Do you want to proceed?');
      // ;
    } else {
      if (_date.text.isEmpty) {
        AppOverlays.showErrorSnackBar(
            context: context, message: 'Select a  date');
        return;
      }
      if (_address.text.isEmpty) {
        AppOverlays.showErrorSnackBar(
            context: context, message: 'Enter an address');
        return;
      }

      AppOverlays.showConfirmDialog(
          context: context,
          ref: ref,
          confirmAction: () {
            context.pop();

            ref.read(specialProvider.notifier).createSpecialRequest(
                context: context,
                ref: ref,
                date: _date.text,
                altAddress: _address.text);
          },
          message:
              'Creating this special request will lead to a deduction of NGN ${charge.formatWithCommas} from your wallet. \n Do you want to proceed?');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final getFlatRate =
    final homeOwner = ref.watch(authProvider).user;
    //    final homeOwner = ref.watch(authProvider).user;
    final address = homeOwner?.address ?? '';
    final name = homeOwner?.firstName ?? '';
    final image = homeOwner?.avatar ?? '';
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false, actions: [
        AppBarIcon(name: name, image: image),
        SizedBox(width: width(context) * 0.04)
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: FutureBuilder(
              future: ref.watch(specialProvider).getFlatRate(ref),
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
                  return Column(
                    children: [
                      SizedBox(width: width(context)),
                      const DoubleTitle(
                          leadingTitle: '   Special Request',
                          leadingContent: '   Create a special cleaning pickup',
                          trailingTitle: '',
                          trailingContent: '',
                          hasBackground: true),
                      DropDownPicker(
                        label: 'Request Address',
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
                          ? RowTitle2(title: 'Address', content: address)
                          : EditableTextField(
                              controller: _address,
                              keyboardType: TextInputType.streetAddress,
                              label: 'Custom Address',
                              isEditable: true,
                            ),
                      DatePicker(
                        _date,
                      ),
                      SizedBox(height: height(context) * 0.04),
                      AppButton(text: 'Proceed', onPressed: submitRequest)
                    ],
                  );
                }
              }),
        )),
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  final TextEditingController dateController;
  final String? text;

  const DatePicker(
    this.dateController, {
    this.text = "Expected pickup date",
    Key? key,
  }) : super(key: key);
  @override
  State<DatePicker> createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  //TextEditingController dateController = TextEditingController();
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
        widget.dateController.text = selectedDate.regularDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomDoubleTitle(
      leadingTitle: 'Date',
      leadingContent: widget.dateController.text.isEmpty
          ? widget.text.toString()
          : widget.dateController.text,
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