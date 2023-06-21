import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class CategorySelector extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onSelected;
  const CategorySelector(
      {super.key,
      required this.isSelected,
      required this.title,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FilterChip(
          backgroundColor: isSelected ? AppColors.primary : Colors.white,
          label: Text(title,
              style: medium16(context).copyWith(
                  color: isSelected
                      ? Colors.white
                      : Colors.black.withOpacity(0.4))),
          onSelected: (val) {
            onSelected();
          }),
    );
  }
}
