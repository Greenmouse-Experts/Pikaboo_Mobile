import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class DropDownPicker extends StatefulWidget {
  final String label;
  final String hint;
  final List<DropdownMenuItem<Object>>? items;
  final Function onChanged;
  final dynamic value;
  final bool hasHeader;
  const DropDownPicker({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.hasHeader = false,
    this.value,
  });

  @override
  State<DropDownPicker> createState() => _DropDownPickerState();
}

class _DropDownPickerState extends State<DropDownPicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context) * 0.0075),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.hasHeader
              ? Text(widget.label, style: medium16(context).copyWith())
              : const SizedBox(),
          widget.hasHeader
              ? SizedBox(height: height(context) * 0.01)
              : const SizedBox(),
          DropdownButtonFormField(
              decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error)),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.altAsh)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.darkGreen)),
              ),
              hint: Text(widget.hint.capitalizeFirst()),
              value: widget.value,
              items: widget.items,
              onChanged: (val) {
                setState(() {
                  widget.onChanged(val);
                });
              }),
        ],
      ),
    );
  }
}
