import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class PageHeader extends StatelessWidget {
  final String title;

  /// Leave has search as true when you want a search button to appear
  final bool hasSearch;
  const PageHeader({super.key, this.hasSearch = true, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: semi20(context).copyWith(color: AppColors.darkGreen),
        ),
        hasSearch
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: isMobile(context)
                      ? width(context) * 0.06
                      : width(context) * 0.045,
                ))
            : const SizedBox()
      ],
    );
  }
}
