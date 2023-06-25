import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class FeedbackStatusView extends StatelessWidget {
  const FeedbackStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fadeGreen,
      body: SafeArea(
        child: Padding(
          padding: screenPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height(context) * 0.075),
              AppSvgImage(
                image: 'assets/images/icons/thumbs-up.svg',
                imageHeight: height(context) * 0.08,
              ),
              SizedBox(height: height(context) * 0.01),
              const PageHeader(title: 'Thank You!', hasSearch: false),
              SizedBox(height: height(context) * 0.01),
              Text(
                'Your feedback was successfully submitted.',
                style: regular14(context)
                    .copyWith(color: Colors.black.withOpacity(0.4)),
              ),
              SizedBox(height: height(context) * 0.02),
              InkWell(
                onTap: () => context.pop(),
                child: Text(
                  'Back to Home',
                  style: medium14(context).copyWith(color: AppColors.primary),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
