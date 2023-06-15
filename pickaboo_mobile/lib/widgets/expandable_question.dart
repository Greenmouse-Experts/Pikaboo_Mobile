import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import '../utilities/utilities.dart';

class ExpandableQuestion extends StatelessWidget {
  final String question;
  const ExpandableQuestion({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandableNotifier(
            child: Expandable(
                collapsed: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpandableButton(
                        child: QuestionHeader(
                      isExpanded: false,
                      question: question,
                    ))
                  ],
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpandableButton(
                        child: QuestionHeader(
                      isExpanded: true,
                      question: question,
                    )),
                    SizedBox(height: height(context) * 0.01),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eros ligula, rutrum imperdiet',
                        style: medium13(context)
                            .copyWith(color: Colors.black.withOpacity(0.4)))
                  ],
                ))),
        SizedBox(height: height(context) * 0.01),
        Divider(color: Colors.black.withOpacity(0.15)),
      ],
    );
  }
}

class QuestionHeader extends StatelessWidget {
  final bool isExpanded;
  final String question;
  const QuestionHeader(
      {super.key, required this.isExpanded, required this.question});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          question,
          style: medium13(context),
        ),
        const Spacer(),
        Container(
          width: width(context) * 0.07,
          height: width(context) * 0.07,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black.withOpacity(0.4))),
          child: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: width(context) * 0.06,
              color: Colors.black.withOpacity(0.4)),
        )
      ],
    );
  }
}
