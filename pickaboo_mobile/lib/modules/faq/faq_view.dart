import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fadeGreen,
      appBar: customAppBar3(context,
          bgColor: AppColors.fadeGreen, hasElevation: false),
      body: SafeArea(
          child: Padding(
        padding: screenPadding(context),
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: 'FAQs',
                hasSearch: false,
              ),
              TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black.withOpacity(0.4),
                  labelStyle: medium13(context),
                  unselectedLabelStyle: medium13(context)
                      .copyWith(color: Colors.black.withOpacity(0.4)),
                  indicatorColor: AppColors.darkGreen,
                  tabs: const [
                    Tab(text: 'FAQs'),
                    Tab(text: 'Feedback'),
                    Tab(text: 'What’s new'),
                  ]),
              SizedBox(
                  height: adjustedHeight(context) * 0.88,
                  child: const TabBarView(children: [
                    FaqWidget(),
                    Center(child: Text('Feedback')),
                    Center(child: Text('What’s new'))
                  ]))
            ],
          ),
        ),
      )),
    );
  }
}

class FaqWidget extends StatelessWidget {
  const FaqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height(context) * 0.01),
          Padding(
            padding: EdgeInsets.all(width(context) * 0.01),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 2,
                child: const SearchTextField(
                    hintText: 'Search Keywords', islocation: false)),
          ),
          SizedBox(height: height(context) * 0.015),
          const PageHeader(title: 'About Pikaboo', hasSearch: false),
          SizedBox(height: height(context) * 0.02),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 70,
              itemBuilder: (context, i) {
                return const ExpandableQuestion();
              })
        ],
      ),
    );
  }
}
