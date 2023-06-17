import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/widgets.dart';
import 'driver_dashboard_vm.dart';

class DriverDashboardView extends ConsumerWidget {
  const DriverDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(DriverDashboardViewModel.provider);
    return WillPopScope(
      onWillPop: () async {
        if (index != 0) {
          ref.read(DriverDashboardViewModel.provider.notifier).updateIndex(0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) =>
              DriverDashboardViewModel.pages[index],
        ),
        bottomNavigationBar: const DriverNavBar(),
      ),
    );
  }
}
