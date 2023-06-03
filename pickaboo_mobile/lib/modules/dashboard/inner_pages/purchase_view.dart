import 'package:flutter/material.dart';

import '../../../utilities/utilities.dart';

class PurchaseView extends StatelessWidget {
  const PurchaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height(context) * 0.4),
          const Center(child: Text('Purchase Page')),
        ],
      ),
    );
  }
}
