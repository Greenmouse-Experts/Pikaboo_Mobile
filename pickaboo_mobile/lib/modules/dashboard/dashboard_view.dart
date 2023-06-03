import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/widgets.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(DashboardViewModel.provider);
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) =>
            DashboardViewModel.anonDashboardPages[index],
      ),
      bottomNavigationBar: const AnonNavBar(),
    );
  }
}
