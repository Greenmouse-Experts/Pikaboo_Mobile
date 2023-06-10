import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class DriverHistoryView extends StatelessWidget {
  const DriverHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar3(context, hasElevation: false),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const PageHeader(title: 'History', hasSearch: false),
              SizedBox(height: height(context) * 0.01),
              Text('Jun 2023',
                  style: semi13(context)
                      .copyWith(color: Colors.black.withOpacity(0.3))),
              SizedBox(height: height(context) * 0.02),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return const DriverHistoryCard();
                  })
            ],
          ),
        )),
      ),
    );
  }
}
