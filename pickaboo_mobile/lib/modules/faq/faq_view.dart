import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../data/models/models.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: DefaultTabController(
            length: 2,
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
                      // Tab(text: 'What’s new'),
                    ]),
                SizedBox(
                    height: !isMobile(context)
                        ? height(context) * 0.805
                        : Platform.isIOS
                            ? adjustedHeight(context) * 0.88
                            : adjustedHeight(context) * 0.92,
                    child: const TabBarView(children: [
                      FaqWidget(),
                      FeedbackWidget(),
                      //Center(child: Text('What’s new'))
                    ]))
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class FeedbackWidget extends ConsumerStatefulWidget {
  const FeedbackWidget({super.key});

  @override
  ConsumerState<FeedbackWidget> createState() => _FeedbackWidgetConsumerState();
}

class _FeedbackWidgetConsumerState extends ConsumerState<FeedbackWidget> {
  final improvement = TextEditingController();

  double selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: width(context), height: height(context) * 0.02),
        const PageHeader(title: 'Rate Your Experience', hasSearch: false),
        SizedBox(height: height(context) * 0.01),
        Text('Are you satisfied with our services?',
            style: regular14(context)
                .copyWith(color: Colors.black.withOpacity(0.4))),
        SizedBox(height: height(context) * 0.01),
        RatingBar.builder(
            minRating: 1,
            maxRating: 5,
            itemCount: 5,
            glowColor: AppColors.gold,
            itemBuilder: (context, i) => const Icon(
                  Icons.star_outline_outlined,
                  color: AppColors.primary,
                ),
            onRatingUpdate: (rating) {
              selectedRating = rating;
            }),
        SizedBox(height: height(context) * 0.02),
        const Divider(color: AppColors.lightAsh),
        SizedBox(height: height(context) * 0.02),
        Text('Tell us what can be improved', style: medium14(context)),
        SizedBox(height: height(context) * 0.01),
        TextArea(
            hintText: 'Tell us how we can improve', controller: improvement),
        SizedBox(height: height(context) * 0.02),
        AppButton(
            text: 'Submit',
            onPressed: () {
              if (selectedRating == 0) {
                AppOverlays.showErrorSnackBar(
                    context: context, message: 'Select a rating');
                return;
              }
              if (improvement.text.isEmpty) {
                AppOverlays.showErrorSnackBar(
                    context: context, message: 'Enter a message');
                return;
              }
              ref.read(authProvider.notifier).rateApplication(
                  context: context,
                  rating: selectedRating.toString(),
                  improvement: improvement.text,
                  ref: ref);
            }),
      ],
    );
  }
}

class FaqWidget extends StatefulWidget {
  const FaqWidget({super.key});

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  final _search = TextEditingController();

  var theQuestions = questions;

  void searchFaq(String question) {
    setState(() {
      theQuestions = questions;
      theQuestions = theQuestions
          .where((element) =>
              element.questions.toLowerCase().contains(question.toLowerCase()))
          .toList();
    });
  }

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
                child: SearchTextField(
                    onChanged: (val) {
                      searchFaq(val);
                    },
                    controller: _search,
                    hintText: 'Search Keywords',
                    islocation: false)),
          ),
          SizedBox(height: height(context) * 0.02),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: theQuestions.length,
              itemBuilder: (context, i) {
                return ExpandableQuestion(
                  question: theQuestions[i].questions,
                  answer: theQuestions[i].answers,
                );
              })
        ],
      ),
    );
  }
}

final List<QuestionsSchema> questions = [
  QuestionsSchema(
    questions: 'Can I use PikaBoo App from anywhere ?',
    answers:
        'Your local Waste Management Authority has to be subscribed to the use of the App service before you can get signed on.',
  ),
  QuestionsSchema(
      questions: 'Where is the Head Office located ?',
      answers:
          'OPIC Plaza, 26, Mobolaji Bank-Anthony Way, Ikeja, Lagos, Nigeria'),
  QuestionsSchema(
      questions: 'Is the company a registered entity ?',
      answers:
          'PikaBoo is a registered Software trademark of Highgate Global Resources Limited, a company registered under the Corporate Affairs Commission of Nigeria.'),
  QuestionsSchema(
    questions: 'Can I earn on the PikaBoo App ?',
    answers:
        'Yes, you can. You can earn as one of the active service providers in the system either as a Waste Manager or a Driver or Serviceman.',
  ),
  QuestionsSchema(
    questions: 'What is the eligible age for subscription to the PikaBoo App ?',
    answers:
        'Users must have attained the age of 18 to be eligible for subscription.',
  ),
  QuestionsSchema(
    questions: 'How do I get waste pick-up service ?',
    answers:
        'Waste pick-up services are rendered in two ways: regular scheduled pick-ups to which every paying subscriber is entitled; and special pick-up calls which are available to every subscribed user for a premium above the monthly waste pick-up levy. Special calls are only available to residents who are not indebted to the system as at time of call.',
  ),
  QuestionsSchema(
    questions: 'How do I fund my Wallet ?',
    answers:
        'Your wallet can be funded by standard electronic Funds Transfer from any of your existing accounts and your wallet update real-time',
  ),
  QuestionsSchema(
    questions: 'Is there a refund if I lay a complaint ?',
    answers:
        'PikaBoo does not make decisions on refunds as such decisions are subject to recommendation by law of your local Waste Management Authority.',
  ),
  QuestionsSchema(
    questions:
        'How long before I get my clean-up done in special request call ?',
    answers:
        'Response to special calls is an uninterrupted process driven by the availability of service personnel within the area of call provided calls are within service hours.',
  ),
  QuestionsSchema(
      questions: 'What are the Service Hours ?',
      answers:
          'PikaBoo Service Hours are generally as stipulated by the local Waste Management Authority but usually daylight hours between 0700 and 1700Hours.')
];

// final List<String> theQuestions = [];

// final List<String> theAnswers = [];

final List<String> theImprovements = [
  'Overall services',
  'Customer support',
  'Speed and efficiency',
  'Transparency',
  'Pickup and response service',
  'Quality'
];

final improveProvider =
    NotifierProvider<ImprovedNotifier, List<String>>(ImprovedNotifier.new);

class ImprovedNotifier extends Notifier<List<String>> {
  @override
  build() {
    return [];
  }

  void addNewItem(String newItem) {
    state = [...state, newItem];
  }

  void removeItem(String item) {
    state = [
      for (final oldItem in state)
        if (oldItem != item) oldItem,
    ];
  }
}
