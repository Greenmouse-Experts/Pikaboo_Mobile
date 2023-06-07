import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import '../utilities/utilities.dart';

class ExpandableQuestion extends StatelessWidget {
  const ExpandableQuestion({super.key});

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
                        child: const QuestionHeader(isExpanded: false))
                  ],
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpandableButton(
                        child: const QuestionHeader(isExpanded: true)),
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
  const QuestionHeader({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'What is Pikaboo?',
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
