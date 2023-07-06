import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar5(
        context,
        hasElevation: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: screenPadding(context),
        child: Column(
          children: [
            const PageHeader(title: 'Shopping Cart', hasSearch: false),
            SizedBox(
              height: height(context) * 0.5,
              child: ListView.builder(
                  itemCount: 8,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return const CartCard();
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
