import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utilities/utilities.dart';

class AppTextField extends ConsumerWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool hasLabel;
  final TextInputType keyboardType;
  const AppTextField(
      {super.key,
      required this.label,
      required this.keyboardType,
      this.hintText = '',
      this.hasLabel = true,
      this.isPassword = false,
      required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasLabel
            ? Text(label,
                style: medium14(context).copyWith(color: AppColors.primary))
            : const SizedBox(),
        SizedBox(height: height(context) * 0.01),
        Consumer(builder: (context, ref, child) {
          final isVisible = ref.watch(switchProvider);
          return TextFormField(
            cursorColor: AppColors.primary,
            controller: controller,
            obscureText: isPassword ? isVisible : false,
            obscuringCharacter: "*",
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {
                        ref.read(switchProvider.notifier).switchState();
                      },
                      icon: Icon(
                          isVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.primary))
                  : !hasLabel
                      ? Container(
                          padding: const EdgeInsets.only(right: 5),
                          width: width(context) * 0.19,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              label,
                              style: medium13(context).copyWith(
                                  color: Colors.black.withOpacity(0.4)),
                            ),
                          ),
                        )
                      : null,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.darkGreen)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.darkGreen)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.darkGreen)),
            ),
          );
        })
      ],
    );
  }
}

final switchProvider =
    NotifierProvider<IsVisibleNotifier, bool>(IsVisibleNotifier.new);

class IsVisibleNotifier extends Notifier<bool> {
  @override
  build() {
    return true;
  }

  void switchState() {
    state = !state;
  }
}

class SearchTextField extends StatelessWidget {
  final String hintText;
  final bool islocation;
  const SearchTextField(
      {super.key, required this.hintText, required this.islocation});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          filled: islocation,
          fillColor: islocation ? AppColors.lightAsh.withOpacity(0.17) : null,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: AppColors.lightAsh.withOpacity(0.17))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: AppColors.lightAsh.withOpacity(0.17))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: AppColors.lightAsh.withOpacity(0.17))),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.primary,
            size: width(context) * 0.06,
          )),
    );
  }
}

class AppTextField2 extends ConsumerWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool hasLabel;
  final bool readOnly;

  final TextInputType keyboardType;
  const AppTextField2(
      {super.key,
      required this.label,
      required this.keyboardType,
      this.hintText = '',
      this.hasLabel = true,
      this.isPassword = false,
      this.readOnly = false,
      required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasLabel ? Text(label, style: medium14(context)) : const SizedBox(),
        SizedBox(height: height(context) * 0.005),
        Consumer(builder: (context, ref, child) {
          final isVisible = ref.watch(switchProvider);
          return TextFormField(
            cursorColor: AppColors.primary,
            controller: controller,
            obscureText: isPassword ? isVisible : false,
            obscuringCharacter: "*",
            keyboardType: keyboardType,
            readOnly: readOnly,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              hintText: hintText,
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {
                        ref.read(switchProvider.notifier).switchState();
                      },
                      icon: Icon(
                          isVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.primary))
                  : !hasLabel
                      ? Container(
                          padding: const EdgeInsets.only(right: 5),
                          width: width(context) * 0.19,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              label,
                              style: medium13(context).copyWith(
                                  color: Colors.black.withOpacity(0.4)),
                            ),
                          ),
                        )
                      : null,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black)),
            ),
          );
        })
      ],
    );
  }
}

class DropDownTextField extends StatefulWidget {
  final String label;
  final String hintText;

  const DropDownTextField(
      {super.key, required this.label, required this.hintText});

  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  String? dropdownvalue;

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: medium14(context)),
        SizedBox(height: height(context) * 0.005, width: width(context)),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: DropdownButton(
              hint: Text(widget.hintText),
              underline: const SizedBox(),
              value: dropdownvalue,
              isExpanded: true,
              borderRadius: BorderRadius.circular(10),
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DateTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  const DateTextField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller});

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: medium14(context)),
        SizedBox(height: height(context) * 0.005, width: width(context)),
        TextFormField(
          cursorColor: AppColors.primary,
          controller: widget.controller,
          obscuringCharacter: "*",
          onTap: () async {
            final DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: AppColors.primary, // <-- SEE HERE
                        onPrimary: Colors.white, // <-- SEE HERE
                        onSurface: Colors.black, // <-- SEE HERE
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                            // foregroundColor: AppColors.primary, // button text color
                            ),
                      ),
                    ),
                    child: child!,
                  );
                });
            if (selectedDate != null) {
              widget.controller.text = selectedDate.toString();
            }
          },
          readOnly: true,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            hintText: widget.hintText,
            suffixIcon: Icon(Icons.calendar_today_outlined,
                size: width(context) * 0.06, color: Colors.black),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black)),
          ),
        )
      ],
    );
  }
}

class EditableTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const EditableTextField(
      {super.key,
      required this.label,
      required this.controller,
      required this.keyboardType});

  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  // TextEditingController hasdk = TextEditingController();
  bool isEditMode = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style:
              regular14(context).copyWith(color: Colors.black.withOpacity(0.4)),
        ),
        isEditMode
            ? AppTextField2(
                label: '',
                keyboardType: widget.keyboardType,
                controller: widget.controller,
                hasLabel: false,
              )
            : Row(
                children: [
                  Text(widget.controller.text, style: medium14(context)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isEditMode = true;
                        });
                      },
                      icon: Icon(Icons.edit_sharp, size: width(context) * 0.05))
                ],
              ),
        const Divider(color: AppColors.lightAsh)
      ],
    );
  }
}
