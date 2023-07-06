import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../controllers/products/product_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../anon_dashboard/anon_dashboard_viewmodel.dart';
import '../user_dashboard/user_dashboard_vm.dart';

class MarketPlaceView extends ConsumerWidget {
  final String canGoBack;
  const MarketPlaceView({super.key, required this.canGoBack});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.watch(
      productProvider,
    );
    final homeOwner = ref.watch(authProvider).user;
    final name = homeOwner?.firstName ?? '';
    final image = homeOwner?.avatar ?? '';
    return Scaffold(
      appBar: customAppBar5(context,
          hasElevation: false,
          onLeadingPressed: canGoBack == 'yes'
              ? null
              : canGoBack == 'user'
                  ? () {
                      ref
                          .read(UserDashboardViewModel.provider.notifier)
                          .updateIndex(0);
                    }
                  : () {
                      ref
                          .read(AnonDashboardViewModel.provider.notifier)
                          .updateIndex(0);
                    },
          actions: [
            AppAvatar(
              name: name,
              imgUrl: image,
              radius: isMobile(context)
                  ? width(context) * 0.045
                  : width(context) * 0.04,
            ),
            SizedBox(width: width(context) * 0.04)
          ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding: screenPadding(context),
                child: FutureBuilder(
                    future: productNotifier.getAllProducts(ref: ref),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const PageLoader();
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const PageHeader(title: 'Shop', hasSearch: false),
                            SizedBox(height: height(context) * 0.01),
                            Text('Search varieties of trash cans and bins',
                                style: medium13(context)),
                            SizedBox(height: height(context) * 0.02),
                            const SearchTextField(
                                hintText: 'Search', islocation: true),
                            SizedBox(height: height(context) * 0.02),
                            SizedBox(
                              height: height(context) * 0.05,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, i) => CategorySelector(
                                        title: 'All',
                                        isSelected: i == 0,
                                        onSelected: () {},
                                      )),
                            ),
                            Consumer(builder: (context, ref, child) {
                              final isSingle = ref.watch(switchProvider);
                              return Row(
                                children: [
                                  IconButton(
                                      onPressed:
                                          productNotifier.links?.next == null
                                              ? null
                                              : () {},
                                      icon: Icon(
                                        Icons.skip_previous,
                                        color:
                                            productNotifier.links?.next == null
                                                ? null
                                                : AppColors.primary,
                                        size: isMobile(context)
                                            ? width(context) * 0.06
                                            : width(context) * 0.05,
                                      )),
                                  Text(
                                    'Page ${productNotifier.meta?.currentPage ?? '1'} / ${productNotifier.meta?.lastPage ?? '1'}',
                                    style: regular14(context),
                                  ),
                                  IconButton(
                                      onPressed:
                                          productNotifier.links?.next == null
                                              ? null
                                              : () {},
                                      icon: Icon(
                                        Icons.skip_next,
                                        color:
                                            productNotifier.links?.next == null
                                                ? null
                                                : AppColors.primary,
                                        size: isMobile(context)
                                            ? width(context) * 0.06
                                            : width(context) * 0.05,
                                      )),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        ref
                                            .read(switchProvider.notifier)
                                            .switchToSingle();
                                      },
                                      child: AppSvgImage(
                                        imageWidth: isMobile(context)
                                            ? width(context) * 0.09
                                            : width(context) * 0.07,
                                        image: 'assets/images/icons/single.svg',
                                        color: isSingle
                                            ? AppColors.primary
                                            : Colors.grey,
                                      )),
                                  SizedBox(width: width(context) * 0.02),
                                  InkWell(
                                      onTap: () {
                                        ref
                                            .read(switchProvider.notifier)
                                            .switchToDouble();
                                      },
                                      child: AppSvgImage(
                                        imageWidth: isMobile(context)
                                            ? width(context) * 0.065
                                            : width(context) * 0.05,
                                        image: 'assets/images/icons/double.svg',
                                        color: !isSingle
                                            ? AppColors.primary
                                            : Colors.grey,
                                      )),
                                ],
                              );
                            }),
                            SizedBox(height: height(context) * 0.01),
                            Consumer(builder: (context, ref, child) {
                              final isSingle = ref.watch(switchProvider);
                              final products =
                                  ref.watch(productProvider).products;

                              return ref.watch(productProvider).products.isEmpty
                                  ? Container(
                                      alignment: Alignment.center,
                                      height: height(context) * 0.4,
                                      child: Center(
                                          child: Text(
                                        'No products available currently, Check again later',
                                        textAlign: TextAlign.center,
                                        style: medium16(context),
                                      )),
                                    )
                                  : isSingle
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: products.length,
                                          itemBuilder: (context, i) =>
                                              ProductCard(
                                                product: products[i],
                                              ))
                                      : GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 0.92,
                                                  crossAxisSpacing:
                                                      width(context) * 0.05,
                                                  mainAxisSpacing:
                                                      height(context) * 0.02),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: products.length,
                                          itemBuilder: (context, i) =>
                                              ProductGridCard(
                                                product: products[i],
                                              ));
                            })
                          ],
                        );
                      }
                    }))),
      ),
    );
  }
}

final switchProvider = StateNotifierProvider<SwitchNotifier, bool>((ref) {
  return SwitchNotifier();
});

class SwitchNotifier extends StateNotifier<bool> {
  SwitchNotifier() : super(true);

  void switchToSingle() {
    state = true;
  }

  void switchToDouble() {
    state = false;
  }
}
