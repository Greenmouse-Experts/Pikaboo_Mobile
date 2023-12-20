

import 'package:flutter/material.dart';
import 'package:pickaboo_mobile/utilities/app_colors.dart';
import 'package:pickaboo_mobile/utilities/app_dimensions.dart';
import 'package:pickaboo_mobile/utilities/string_extensions.dart';
import 'package:pickaboo_mobile/widgets/transaction_history_card.dart';

class HomeOwnerDatePicker extends StatefulWidget {
  final TextEditingController dateController;
  final String? text;

  const HomeOwnerDatePicker(
    this.dateController, {
    this.text = "Expected pickup date",
    super.key,
  });
  @override
  State<HomeOwnerDatePicker> createState() => HomeOwnerDatePickerState();
}

class HomeOwnerDatePickerState extends State<HomeOwnerDatePicker> {
  //TextEditingController dateController = TextEditingController();
  void selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(1980, 1, 1),
        firstDate:DateTime(1900,1,1),
        lastDate: DateTime(2100,12,31),
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
      leadingTitle: 'Date of Birth',
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
