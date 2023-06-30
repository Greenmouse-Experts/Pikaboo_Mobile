import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: Container(
        width:
            isMobile(context) ? width(context) * 0.05 : width(context) * 0.0325,
        height:
            isMobile(context) ? width(context) * 0.05 : width(context) * 0.0325,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black.withOpacity(0.4))),
      ),
      title: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eros ligula.',
          style:
              medium13(context).copyWith(color: Colors.black.withOpacity(0.4))),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert_outlined,
              size: isMobile(context)
                  ? width(context) * 0.06
                  : width(context) * 0.045,
              color: Colors.black)),
    );
  }
}
