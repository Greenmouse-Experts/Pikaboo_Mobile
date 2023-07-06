import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../driver_dashboard/driver_dashboard_vm.dart';

class TermsView extends ConsumerWidget {
  final String isAnon;
  const TermsView({super.key, required this.isAnon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final firstName = user?.firstName ?? '';
    final image = user?.avatar ?? '';
    return Scaffold(
      backgroundColor: AppColors.altWhite,
      appBar: customAppBar5(context,
          hasElevation: false,
          bgColor: AppColors.altWhite, onLeadingPressed: () {
        if (isAnon == 'yes') {
          context.pop();
        } else {
          ref.read(DriverDashboardViewModel.provider.notifier).updateIndex(0);
        }
      }, actions: [
        isAnon == 'yes'
            ? const QuestionIcon()
            : AppBarIcon(name: firstName, image: image),
        SizedBox(width: width(context) * 0.04)
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: Column(
            children: [
              const PageHeader(title: 'User Agreement', hasSearch: false),
              SizedBox(height: height(context) * 0.01),
              const TermsCard(
                question: '1. Terms & Conditions',
                answer:
                    '- Users are not expected to be below 18 years of Age.\n\n- All users of this App are signed up by higher-level operators of the system according to their service requirement.\n\n- Users comprise Registered Residents, Fleet Managers, Waste Managers, Waste Collectors/Drivers. Others are system administrators.\n\n- For best service outcomes, users are expected to promptly meet their payment obligations to the system.',
              ),
              const TermsCard(
                question: '2. Privacy Policy',
                answer:
                    '    In addition to Users’ personal information and details, the use of the App also requires access to users’ registered locations (using geolocation), photographs of their buildings/residence for easy identification and faster service resolution. We do not sell any personal information that is provided by registered users of this App, nor is their private information shared without their express consent.',
              ),
              const TermsCard(
                question: '3. Payment Terms & Refund Policy',
                answer:
                    '    All payments on this platform are as advised by the subscribing local Waste Management Authority through designated personal User wallets from which levies will be swept to service providers. In addition to monthly levies, subscribers will be charged separately, additional fees for special service clearance calls and standard Bin request. No refund shall be due to registered users of this App as it applies to their existing monthly waste levies unless advised otherwise by the local Authority.',
              ),
              SizedBox(height: height(context) * 0.01),
            ],
          ),
        )),
      ),
    );
  }
}
