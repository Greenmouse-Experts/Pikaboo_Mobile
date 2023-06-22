import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class UserLoginView extends ConsumerStatefulWidget {
  final String type;
  const UserLoginView({super.key, required this.type});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserLoginViewState();
}

class _UserLoginViewState extends ConsumerState<UserLoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.primary,
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: height(context) * 0.075),
                  Image.asset('assets/images/pickaboo_alt_logo.png'),
                  SizedBox(
                    width: width(context),
                    height: 2,
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
                child: Container(
                  padding: screenPadding(context),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      SizedBox(height: height(context) * 0.05),
                      AppTextField(
                          controller: emailController,
                          keyboardType: TextInputType.phone,
                          label: 'Phone Number',
                          hintText: '09028912673'),
                      SizedBox(height: height(context) * 0.02),
                      AppTextField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'OTP',
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
                              style: regular13(context).copyWith(
                                  color: AppColors.darkAsh.withOpacity(0.85)))
                        ],
                      ),
                      SizedBox(height: height(context) * 0.02),
                      AppButton(
                          text: 'Login',
                          onPressed: () {
                            widget.type == 'user'
                                ? context.goNamed(AppRouter.userDashboard)
                                : context.goNamed(AppRouter.driverDashboard);
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
