import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/widgets.dart';
import 'anon_dashboard_viewmodel.dart';

class AnonDashboardView extends ConsumerWidget {
  const AnonDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(AnonDashboardViewModel.provider);
    return WillPopScope(
      onWillPop: () async {
        if (index != 0) {
          ref.read(AnonDashboardViewModel.provider.notifier).updateIndex(0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) => AnonDashboardViewModel.pages[index],
        ),
        bottomNavigationBar: const AnonNavBar(),
      ),
    );
  }
}
