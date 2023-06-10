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
