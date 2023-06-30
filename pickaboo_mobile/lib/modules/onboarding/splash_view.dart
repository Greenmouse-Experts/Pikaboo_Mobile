import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
    Future.delayed(const Duration(seconds: 6), () {
      context.goNamed(AppRouter.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: isLoading ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width(context) * 0.2,
                      height: height(context) * 0.1,
                      child: Image.asset('assets/images/pickaboo_alt_logo.png'),
                    ).animate().fade(duration: 200.ms).scale().move(
                          delay: const Duration(seconds: 3, microseconds: 1000),
                          duration: 1200.ms,
                          begin: Offset(width(context) / 5, 0),
                        ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'PIKABOO',
                            style:
                                semi30(context).copyWith(color: Colors.white),
                          ),
                          Text(
                            'WASTE MANAGEMENT',
                            style:
                                medium12(context).copyWith(color: Colors.white),
                          ),
                        ],
                      ).animate().fade(duration: 500.ms).scale().move(
                            delay:
                                const Duration(seconds: 3, microseconds: 800),
                            duration: 1300.ms,
                            begin: Offset(width(context), 0),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: isLoading,
            child: Center(
              child: SizedBox(
                height: width(context) * 0.2,
                width: width(context) * 0.2,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
