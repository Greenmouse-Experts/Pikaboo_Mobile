import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utilities/utilities.dart';

class AppTextField extends ConsumerWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  const AppTextField(
      {super.key,
      required this.label,
      this.hintText = '',
      this.isPassword = false,
      required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: medium14(context).copyWith(color: AppColors.primary)),
        SizedBox(height: height(context) * 0.01),
        Consumer(builder: (context, ref, child) {
          final isVisible = ref.watch(switchProvider);
          return TextFormField(
            cursorColor: AppColors.primary,
            controller: controller,
            obscureText: isPassword ? isVisible : false,
            obscuringCharacter: "*",
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
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Search Locations',
          filled: true,
          fillColor: AppColors.lightAsh.withOpacity(0.17),
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
