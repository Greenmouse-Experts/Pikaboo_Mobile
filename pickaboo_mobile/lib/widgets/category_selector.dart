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

class ImprovementSelector extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onSelected;
  const ImprovementSelector(
      {super.key,
      required this.isSelected,
      required this.title,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 6, top: 6),
      child: FilterChip(
        backgroundColor: isSelected ? AppColors.primary : AppColors.ash2,
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: regular14(context).copyWith(
                  color: isSelected
                      ? Colors.white
                      : Colors.black.withOpacity(0.4))),
        ),
        onSelected: (val) {
          onSelected();
        },
      ),
    );
  }
}
