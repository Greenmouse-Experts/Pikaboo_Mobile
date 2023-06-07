import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar3(context, hasElevation: false),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(title: 'History'),
              SizedBox(height: height(context) * 0.01),
              Text('All History', style: medium13(context)),
              SizedBox(height: height(context) * 0.01),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: width(context),
                          height: height(context) * 0.01),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Today - Monday, June 5, 2023',
                            style: medium13(context)),
                      ),
                      SizedBox(height: height(context) * 0.01),
                      ListView.builder(
                          itemCount: 20,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return const HistoryTile();
                          }),
                      SizedBox(height: height(context) * 0.01),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
