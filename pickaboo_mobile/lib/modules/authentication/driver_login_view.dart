import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class DriverLoginView extends ConsumerStatefulWidget {
  const DriverLoginView({super.key});

  @override
  ConsumerState<DriverLoginView> createState() =>
      _DriverLoginViewConsumerState();
}

class _DriverLoginViewConsumerState extends ConsumerState<DriverLoginView> {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar7(
          context,
          hasElevation: false,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primary, Colors.white],
                  stops: [0.2, 0.2],
                ),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      ClipOval(
                        clipper: MyClipper(),
                        child: Container(
                          padding: screenPadding(context),
                          width: width(context),
                          color: AppColors.primary,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: width(context) * 0.14,
                                      height: height(context) * 0.07,
                                      child: Image.asset(
                                          'assets/images/pickaboo_alt_logo.png')),
                                  const SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Text(
                                        'PIKABOO',
                                        style: semi30(context)
                                            .copyWith(color: Colors.white),
                                      ),
                                      Text(
                                        'WASTE MANAGEMENT',
                                        style: medium12(context)
                                            .copyWith(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: height(context) * 0.03),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: screenPadding(context),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height(context) * 0.04),
                          const PageHeader(
                              title: 'Log into\nyour account',
                              hasSearch: false),
                          SizedBox(height: height(context) * 0.01),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Fill in your details to login as a ',
                                    style: medium14(context).copyWith(
                                        color: Colors.black.withOpacity(0.4))),
                                TextSpan(
                                    text: 'Service Personnel ',
                                    style: medium14(context)
                                        .copyWith(color: AppColors.primary)),
                              ],
                            ),
                          ),
                          SizedBox(height: height(context) * 0.04),
                          AppTextField(
                              controller: _phone,
                              keyboardType: TextInputType.phone,
                              label: 'Phone',
                              validator: Validations.validPhone,
                              hintText: '08012345678'),
                          SizedBox(height: height(context) * 0.02),
                          AppTextField(
                              controller: _password,
                              keyboardType: TextInputType.visiblePassword,
                              label: 'Password',
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
                                  ref.read(authProvider.notifier).userLogin(
                                      context: context,
                                      phone: _phone.text,
                                      isUser: false,
                                      ref: ref,
                                      otp: _password.text);
                                }
                              }),
                          SizedBox(height: height(context) * 0.03),
                          Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.pushNamed(AppRouter.forgotPassword);
                                },
                                child: Column(children: [
                                  Text('Forgot Password',
                                      style: medium14(context).copyWith(
                                          color: AppColors.darkGreen)),
                                  const SizedBox(height: 1),
                                  Container(
                                      width: width(context) * 0.3,
                                      height: 1,
                                      color: AppColors.darkGreen),
                                ]),
                              ),
                              SizedBox(
                                  height: height(context) * 0.02,
                                  width: width(context)),
                              Text(
                                'Need help logging in to your account?',
                                style: medium12(context).copyWith(
                                    color: Colors.black.withOpacity(0.7)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
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

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(center: const Offset(200, 4), radius: size.width);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
