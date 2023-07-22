import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class ResetStatusView extends StatelessWidget {
  final String phone;
  const ResetStatusView({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar4(context, hasElevation: false, implyLeading: true),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(width: width(context), height: height(context) * 0.1),
          SizedBox(
            height: height(context) * 0.15,
            child: Image.asset('assets/images/checkmail.png'),
          ),
          SizedBox(height: height(context) * 0.025),
          Text(
            'Check Your Messages ',
            style: semi20(context).copyWith(color: AppColors.darkGreen),
          ),
          SizedBox(height: height(context) * 0.025),
          SizedBox(
            width: width(context) * 0.7,
            child: Text(
              'We have sent an sms to $phone containing your new passcode details.',
              textAlign: TextAlign.center,
              style: medium13(context)
                  .copyWith(color: Colors.black.withOpacity(0.7)),
            ),
          ),
          SizedBox(height: height(context) * 0.035),
          AppButton(
            text: 'Proceed to Login',
            onPressed: () {
              context.pop();
            },
            buttonWidth: 0.35,
          ),
          const Spacer(),
          SizedBox(
            width: width(context) * 0.75,
            child: ActionText(
                action: () {},
                leadingText:
                    'Did not receive any message? Check your spam filter, or ',
                actionText: 'try another phone number.'),
          ),
          SizedBox(height: height(context) * 0.02),
        ],
      )),
    );
  }
}
