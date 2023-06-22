import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class DriverLoginView extends StatefulWidget {
  const DriverLoginView({super.key});

  @override
  State<DriverLoginView> createState() => _DriverLoginViewState();
}

class _DriverLoginViewState extends State<DriverLoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false),
      body: SafeArea(
          child: Padding(
        padding: screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height(context) * 0.1),
            const PageHeader(title: 'Log into\nyour account', hasSearch: false),
            SizedBox(height: height(context) * 0.01),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Fill in your details to login as a ',
                      style: medium14(context)
                          .copyWith(color: Colors.black.withOpacity(0.4))),
                  TextSpan(
                      text: 'Service Personnel ',
                      style:
                          medium14(context).copyWith(color: AppColors.primary)),
                ],
              ),
            ),
            SizedBox(height: height(context) * 0.04),
            AppTextField(
                controller: emailController,
                keyboardType: TextInputType.phone,
                label: 'Email',
                hintText: 'victor@gmail.com'),
            SizedBox(height: height(context) * 0.02),
            AppTextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                label: 'Password',
                hintText: '********',
                isPassword: true),
            Row(
              children: [
                Consumer(builder: (context, ref, child) {
                  final remember = ref.watch(_rememberMe);
                  return Checkbox.adaptive(
                      activeColor: AppColors.primary,
                      value: remember,
                      onChanged: (newval) {
                        ref.read(_rememberMe.notifier).switchState();
                      });
                }),
                Text('Remember Me',
                    style: regular13(context)
                        .copyWith(color: AppColors.darkAsh.withOpacity(0.85)))
              ],
            ),
            SizedBox(height: height(context) * 0.02),
            AppButton(
                text: 'Login',
                onPressed: () {
                  context.goNamed(AppRouter.driverDashboard);
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
                        style: medium14(context)
                            .copyWith(color: AppColors.darkGreen)),
                    const SizedBox(height: 1),
                    Container(
                        width: width(context) * 0.3,
                        height: 1,
                        color: AppColors.darkGreen),
                  ]),
                ),
                SizedBox(height: height(context) * 0.02, width: width(context)),
                Text(
                  'Need help logging in to your account?',
                  style: medium12(context)
                      .copyWith(color: Colors.black.withOpacity(0.7)),
                )
              ],
            ),
          ],
        ),
      )),
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
