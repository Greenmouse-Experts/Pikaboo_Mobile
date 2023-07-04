import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final TextEditingController _phone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar4(context, implyLeading: true, hasElevation: false),
      body: SafeArea(
        child: Padding(
          padding: screenPadding(context),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(width: width(context), height: height(context) * 0.1),
                SizedBox(
                    height: height(context) * 0.2,
                    child: Image.asset('assets/images/password.png')),
                SizedBox(height: height(context) * 0.025),
                Text(
                  'Need Password Reset?',
                  style: semi20(context).copyWith(color: AppColors.darkGreen),
                ),
                SizedBox(height: height(context) * 0.025),
                SizedBox(
                    width: width(context) * 0.77,
                    child: Text(
                      'Enter the phone number associated with your account and we’ll send an sms with instructions to reset your password',
                      textAlign: TextAlign.center,
                      style: medium13(context)
                          .copyWith(color: Colors.black.withOpacity(0.7)),
                    )),
                SizedBox(height: height(context) * 0.04),
                AppTextField(
                  label: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  validator: Validations.validPhone,
                  controller: _phone,
                  hintText: '08012345678',
                ),
                SizedBox(height: height(context) * 0.06),
                AppButton(
                    text: 'Send Reset',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ref.read(authProvider.notifier).forgotPassword(
                            ref: ref, context: context, phone: _phone.text);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
