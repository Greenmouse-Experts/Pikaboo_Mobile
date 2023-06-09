import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class TermsCard extends StatelessWidget {
  const TermsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context) * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1. Terms & Conditions', style: medium13(context)),
          SizedBox(height: height(context) * 0.015),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque neque ipsum, imperdiet a aliquet quis, facilisis at massa. Maecenas tempor sem id purus consequat finibus. Phasellus aliquet sem luctus risus iaculis aliquet. Phasellus eu pellentesque magna, sit amet luctus purus. Duis eu mauris enim. Pellentesque tortor risus, ultrices sed enim a, pulvinar tincidunt ante. Quisque maximus elit sit amet turpis semper, eu interdum tortor posuere.',
              style: regular11(context)
                  .copyWith(color: Colors.black.withOpacity(0.4)))
        ],
      ),
    );
  }
}
