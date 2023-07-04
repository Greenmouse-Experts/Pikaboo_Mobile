import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class UserLoginView extends ConsumerStatefulWidget {
  final String type;
  const UserLoginView({super.key, required this.type});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserLoginViewState();
}

class _UserLoginViewState extends ConsumerState<UserLoginView> {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _otp = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phone.dispose();
    _otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primary, Colors.white],
              stops: [0.5, 0.5],
            ),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: height(context) * 0.075),
                  SizedBox(
                      width: width(context) * 0.12,
                      height: height(context) * 0.06,
                      child:
                          Image.asset('assets/images/pickaboo_alt_logo.png')),
                  SizedBox(
                    width: width(context),
                    height: 4,
                  ),
                  Text('PIKABOO',
                      style: semi18(context).copyWith(color: Colors.white)),
                  SizedBox(height: height(context) * 0.06),
                  Text(
                    'Fill in your details to login as a Home Resident',
                    style: bold14(context).copyWith(color: Colors.white),
                  ),
                  SizedBox(height: height(context) * 0.03),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: screenPadding(context),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: height(context) * 0.05),
                          AppTextField(
                              controller: _phone,
                              keyboardType: TextInputType.phone,
                              label: 'Phone Number',
                              validator: Validations.validPhone,
                              hintText: '08012345678'),
                          SizedBox(height: height(context) * 0.02),
                          AppTextField(
                              controller: _otp,
                              keyboardType: TextInputType.phone,
                              label: 'OTP',
                              validator: Validations.validOtpPassword,
                              hintText: '*****',
                              isPassword: true),
                          Row(
                            children: [
                              Consumer(builder: (context, ref, child) {
                                final remember = ref.watch(_rememberMe);
                                return Checkbox.adaptive(
                                    activeColor: AppColors.primary,
                                    value: remember,
                                    onChanged: (newval) {
                                      ref
                                          .read(_rememberMe.notifier)
                                          .switchState();
                                    });
                              }),
                              Text('Remember Me',
                                  style: regular13(context).copyWith(
                                      color:
                                          AppColors.darkAsh.withOpacity(0.85)))
                            ],
                          ),
                          SizedBox(height: height(context) * 0.02),
                          AppButton(
                              text: 'Login',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ref
                                      .read(authProvider.notifier)
                                      .homeOwnerLogin(
                                          context: context,
                                          phone: _phone.text,
                                          ref: ref,
                                          otp: _otp.text);
                                }
                              }),
                          SizedBox(height: height(context) * 0.03),
                          TextButton(
                            onPressed: () {
                              context.pushNamed(AppRouter.forgotPassword);
                            },
                            child: Column(children: [
                              Text('Forgot Password',
                                  style: medium14(context)
                                      .copyWith(color: AppColors.darkGreen)),
                              const SizedBox(height: 1),
                              Container(
                                  width: width(context) * 0.3,
                                  height: 1,
                                  color: AppColors.darkGreen),
                            ]),
                          ),
                          SizedBox(height: height(context) * 0.02),
                          Text(
                            'Need help logging in to your account?',
                            style: medium12(context)
                                .copyWith(color: Colors.black.withOpacity(0.7)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final _rememberMe =
    NotifierProvider<_RememberMeNotifier, bool>(_RememberMeNotifier.new);

class _RememberMeNotifier extends Notifier<bool> {
  @override
  build() {
    return true;
  }

  void switchState() {
    state = !state;
  }
}
