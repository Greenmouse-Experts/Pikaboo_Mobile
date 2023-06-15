import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class PickUpRequestView extends StatelessWidget {
  const PickUpRequestView({super.key});

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
              const PageHeader(title: 'Available Pickup', hasSearch: false),
              SizedBox(height: height(context) * 0.01),
              Text('Available garbage pickup in your location today.',
                  style: medium13(context)
                      .copyWith(color: Colors.black.withOpacity(0.4))),
              SizedBox(height: height(context) * 0.02),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, i) {
                    return PickupTile(
                      isFirst: i == 0,
                      isLast: i == 19,
                    );
                  })
            ],
          ),
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(
            horizontal: width(context) * 0.04, vertical: 1),
        child: AppButton(text: 'Save', onPressed: () {}),
      ),
    );
  }
}
