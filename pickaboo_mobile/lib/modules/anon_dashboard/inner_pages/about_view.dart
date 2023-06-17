import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/utilities.dart';
import '../../../widgets/widgets.dart';
import '../anon_dashboard_viewmodel.dart';

class AboutView extends ConsumerWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false, onLeadingPressed: () {
        ref.read(AnonDashboardViewModel.provider.notifier).updateIndex(0);
      }, actions: [
        IconButton(
            onPressed: () {},
            icon: Container(
              width: width(context) * 0.06,
              height: width(context) * 0.06,
              decoration: const BoxDecoration(
                  color: AppColors.newAsh, shape: BoxShape.circle),
              child: Icon(
                Icons.question_mark_outlined,
                color: AppColors.error,
                size: width(context) * 0.04,
              ),
            )),
        SizedBox(width: width(context) * 0.04),
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: screenPadding(context),
            child: Column(
              children: [
                SizedBox(height: height(context) * 0.01),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: 'About ', style: semi20(context)),
                  TextSpan(
                      text: 'PIKABOO',
                      style:
                          semi20(context).copyWith(color: AppColors.darkGreen)),
                  TextSpan(text: ' App', style: semi20(context)),
                ])),
                SizedBox(height: height(context) * 0.01),
                const AboutCard(
                    answer:
                        '    Pika Boo App brings you in total control of your waste management experience from registering for waste pick up services to applying and purchasing a waste bin to receiving scheduled pick-ups and making personalized pick-up request from anywhere in the world from where you might be.'),
                const AboutCard(
                    answer:
                        '    It enables a more efficient management of evacuation resources for maximum impact on the field. It provides a measure of transparency for both residents and service men (or women) who are signed on as customers within the ecosystem. On the one hand it is easy for residents to assess their Waste Manager’s response rate and on the other hand, residents can easily be assessed in terms of their payment obligation to the system.'),
                const AboutCard(
                    answer:
                        '    It speeds up the evacuation process for Waste Managers as it entails the organization of a squad of servicemen to support the clean up process when the full capabilities of the App are unleashed in support of allocated zones. '),
                const AboutCard(
                    answer:
                        '    The use of the App Pika Boo requires the mandatory generation of a residents’ database to build subscriber lists in organized service blocks by authorized Field Operators.  In terms of household waste evacuation, the entire universe of residents is coordinated centrally with the participation of the Fleet Manager, Field Operators, Waste Managers and servicemen who are all compensated from revenues made from subscriber fees.'),
                const AboutCard(
                    answer:
                        'This Application is available to Waste Management jurisdictions for a small fee for deployment in local areas to facilitate clean up purposed.')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
