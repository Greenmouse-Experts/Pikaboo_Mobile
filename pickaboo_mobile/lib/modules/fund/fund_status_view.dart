import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class FundStatusView extends StatelessWidget {
  const FundStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: screenPadding(context),
          child: Column(
            children: [
              SizedBox(
                width: width(context),
                height: height(context) * 0.1,
              ),
              Container(
                alignment: Alignment.center,
                width: width(context) * 0.4,
                height: width(context) * 0.4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3)),
                child: Container(
                  alignment: Alignment.center,
                  width: width(context) * 0.35,
                  height: width(context) * 0.35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.5)),
                  child: Container(
                    alignment: Alignment.center,
                    width: width(context) * 0.3,
                    height: width(context) * 0.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.7)),
                    child: Container(
                      alignment: Alignment.center,
                      width: width(context) * 0.25,
                      height: width(context) * 0.25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.9)),
                      child: Icon(Icons.check,
                          size: width(context) * 0.2, color: AppColors.primary),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height(context) * 0.02),
              Text('Successful !',
                  style: semi20(context).copyWith(color: Colors.white)),
              SizedBox(height: height(context) * 0.02),
              SizedBox(
                width: width(context) * 0.77,
                child: Text(
                    'You have successfully added the sum of NGN 800 to your PIKABOO account.',
                    textAlign: TextAlign.center,
                    style: medium13(context).copyWith(color: Colors.white)),
              ),
              const Spacer(),
              Center(
                  child: GradientButton(
                      text: 'Continue', onPressed: () => context.pop())),
              SizedBox(height: height(context) * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
