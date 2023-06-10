import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class MarketPlaceView extends StatelessWidget {
  const MarketPlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar3(context, hasElevation: false, actions: [
        CircleAvatar(
          radius: width(context) * 0.04,
          backgroundColor: AppColors.lightAsh,
          child: Image.asset('assets/images/dummy_icon.png', fit: BoxFit.cover),
        ),
        SizedBox(width: width(context) * 0.04)
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(title: 'Purchase', hasSearch: false),
              SizedBox(height: height(context) * 0.01),
              Text('Search varieties of trash cans and bins',
                  style: medium13(context)),
              SizedBox(height: height(context) * 0.02),
              const SearchTextField(hintText: 'Search', islocation: true),
              SizedBox(height: height(context) * 0.02),
              SizedBox(
                height: height(context) * 0.05,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, i) =>
                        CategorySelector(isSelected: i == 0)),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, i) => const ProductCard())
            ],
          ),
        )),
      ),
    );
  }
}
