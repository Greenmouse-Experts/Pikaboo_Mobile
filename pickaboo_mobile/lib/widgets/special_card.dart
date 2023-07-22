import 'package:flutter/material.dart';

import '../data/models/models.dart';
import '../utilities/utilities.dart';

class SpecialCard extends StatelessWidget {
  final SpecialRequestSchema request;
  const SpecialCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(width(context) * 0.02),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
