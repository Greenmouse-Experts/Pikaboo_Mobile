import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
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
                  SizedBox(height: height(context) * 0.1),
                  Image.asset('assets/images/pickaboo_alt_logo.png'),
                  SizedBox(
                    width: width(context),
                    height: 2,
                  ),
                  Text('PIKABOO',
                      style: semi18(context).copyWith(color: Colors.white)),
                  SizedBox(height: height(context) * 0.1),
                ],
              ),
              Expanded(
                child: Container(
                  padding: screenPadding(context),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(70))),
                  child: Column(
                    children: [
                      SizedBox(height: height(context) * 0.1),
                      AppTextField(
                          controller: emailController,
                          label: 'Email',
                          hintText: 'youremail@gmail.com'),
                      SizedBox(height: height(context) * 0.02),
                      AppTextField(
                          controller: passwordController,
                          label: 'Password',
                          hintText: '********',
                          isPassword: true),
                      Row(
                        children: [
                          Consumer(builder: (context, ref, child) {
                            final remember = ref.watch(rememberMe);
                            return Checkbox.adaptive(
                                activeColor: AppColors.primary,
                                value: remember,
                                onChanged: (newval) {
                                  ref.read(rememberMe.notifier).switchState();
                                });
                          }),
                          Text('Remember Me',
                              style: regular11(context).copyWith(
                                  color: AppColors.darkAsh.withOpacity(0.85)))
                        ],
                      ),
                      SizedBox(height: height(context) * 0.02),
                      AppButton(
                          text: 'Login',
                          onPressed: () {
                            context.goNamed(AppRouter.userDashboard);
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
                              width: width(context) * 0.28,
                              height: 1,
                              color: AppColors.darkGreen),
                        ]),
                      ),
                      SizedBox(height: height(context) * 0.02),
                      Text(
                        'Need help logging in to your account?',
                        style: medium11(context)
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

final rememberMe =
    NotifierProvider<RememberMeNotifier, bool>(RememberMeNotifier.new);

class RememberMeNotifier extends Notifier<bool> {
  @override
  build() {
    return true;
  }

  void switchState() {
    state = !state;
  }
}
