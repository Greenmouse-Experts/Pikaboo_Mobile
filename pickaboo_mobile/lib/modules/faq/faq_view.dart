import 'dart:io' show Platform;

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
                  height: Platform.isIOS
                      ? adjustedHeight(context) * 0.88
                      : adjustedHeight(context) * 0.92,
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
          //  SizedBox(height: height(context) * 0.015),
          //  const PageHeader(title: 'About Pikaboo', hasSearch: false),
          SizedBox(height: height(context) * 0.02),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: theQuestions.length,
              itemBuilder: (context, i) {
                return ExpandableQuestion(
                  question: theQuestions[i],
                  answer: theAnswers[i],
                );
              })
        ],
      ),
    );
  }
}

final List<String> theQuestions = [
  'Can I use PikaBoo App from anywhere ?',
  'Where is the Head Office located ?',
  'Is the company a registered entity ?',
  'Can I earn on the PikaBoo App ?',
  'What is the eligible age for subscription to the PikaBoo App ?',
  'How do I get waste pick-up service ?',
  'How do I fund my Wallet ?',
  'Is there a refund if I lay a complaint ?',
  'How long before I get my clean-up done in special request call ?',
  'What are the Service Hours ?'
];

final List<String> theAnswers = [
  'Your local Waste Management Authority has to be subscribed to the use of the App service before you can get signed on.',
  'OPIC Plaza, 26, Mobolaji Bank-Anthony Way, Ikeja, Lagos, Nigeria',
  'PikaBoo is a registered Software trademark of Highgate Global Resources Limited, a company registered under the Corporate Affairs Commission of Nigeria.',
  'Yes, you can. You can earn as one of the active service providers in the system either as a Waste Manager or a Driver or Serviceman.',
  'Users must have attained the age of 18 to be eligible for subscription.',
  'Waste pick-up services are rendered in two ways: regular scheduled pick-ups to which every paying subscriber is entitled; and special pick-up calls which are available to every subscribed user for a premium above the monthly waste pick-up levy. Special calls are only available to residents who are not indebted to the system as at time of call.',
  'Your wallet can be funded by standard electronic Funds Transfer from any of your existing accounts and your wallet update real-time',
  'PikaBoo does not make decisions on refunds as such decisions are subject to recommendation by law of your local Waste Management Authority.',
  'Response to special calls is an uninterrupted process driven by the availability of service personnel within the area of call provided calls are within service hours.',
  'PikaBoo Service Hours are generally as stipulated by the local Waste Management Authority but usually daylight hours between 0700 and 1700Hours.'
];
