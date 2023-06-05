import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final bool hasSearch;
  const PageHeader({super.key, this.hasSearch = true, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: semi20(context).copyWith(color: AppColors.primary),
        ),
        hasSearch
            ? IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            : const SizedBox()
      ],
    );
  }
}
