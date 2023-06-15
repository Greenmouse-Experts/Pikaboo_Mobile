import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class CategorySelector extends StatelessWidget {
  final bool isSelected;
  const CategorySelector({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FilterChip(
          backgroundColor: isSelected ? AppColors.primary : Colors.white,
          label: Text('All',
              style: medium16(context).copyWith(
                  color: isSelected
                      ? Colors.white
                      : Colors.black.withOpacity(0.4))),
          onSelected: (val) {}),
    );
  }
}
