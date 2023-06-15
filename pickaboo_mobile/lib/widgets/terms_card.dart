import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class TermsCard extends StatelessWidget {
  final String question;
  final String answer;
  const TermsCard({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context) * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: medium18(context)),
          SizedBox(height: height(context) * 0.015),
          Text(answer,
              style: regular14(context)
                  .copyWith(color: Colors.black.withOpacity(0.4)))
        ],
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  final String answer;
  const AboutCard({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context) * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(answer,
              style: regular16(context)
                  .copyWith(color: Colors.black.withOpacity(0.4)))
        ],
      ),
    );
  }
}
