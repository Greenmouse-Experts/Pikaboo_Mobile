import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/widgets.dart';
import 'user_dashboard_vm.dart';

class UserDashboardView extends ConsumerWidget {
  const UserDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(UserDashboardViewModel.provider);
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) =>
            UserDashboardViewModel.pages[index],
      ),
      bottomNavigationBar: const UserNavBar(),
    );
  }
}