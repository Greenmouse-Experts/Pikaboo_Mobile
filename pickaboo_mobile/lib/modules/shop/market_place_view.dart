import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../anon_dashboard/anon_dashboard_viewmodel.dart';
import '../user_dashboard/user_dashboard_vm.dart';

class MarketPlaceView extends ConsumerWidget {
  final String canGoBack;
  const MarketPlaceView({super.key, required this.canGoBack});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            CircleAvatar(
              radius: width(context) * 0.04,
              backgroundColor: AppColors.lightAsh,
              child: Image.asset('assets/images/dummy_icon.png',
                  fit: BoxFit.cover),
            ),
            SizedBox(width: width(context) * 0.04)
          ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: screenPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(title: 'Shop', hasSearch: false),
              SizedBox(height: height(context) * 0.01),
              Text('Search varieties of trash cans and bins',
                  style: medium13(context)),
              SizedBox(height: height(context) * 0.02),
              const SearchTextField(hintText: 'Search', islocation: true),
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
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_outline_outlined,
                          color: Colors.black,
                          size: width(context) * 0.06,
                        ),
                        label: Text(
                          'Saved',
                          style: regular12(context),
                        )),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          ref.read(switchProvider.notifier).switchToSingle();
                        },
                        child: AppSvgImage(
                          imageWidth: width(context) * 0.09,
                          image: 'assets/images/icons/single.svg',
                          color: isSingle ? AppColors.primary : Colors.grey,
                        )),
                    const SizedBox(width: 10),
                    InkWell(
                        onTap: () {
                          ref.read(switchProvider.notifier).switchToDouble();
                        },
                        child: AppSvgImage(
                          imageWidth: width(context) * 0.065,
                          image: 'assets/images/icons/double.svg',
                          color: !isSingle ? AppColors.primary : Colors.grey,
                        )),
                  ],
                );
              }),
              SizedBox(height: height(context) * 0.01),
              Consumer(builder: (context, ref, child) {
                final isSingle = ref.watch(switchProvider);
                return isSingle
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, i) => const ProductCard())
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.92,
                            crossAxisSpacing: width(context) * 0.05,
                            mainAxisSpacing: height(context) * 0.02),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, i) => const ProductGridCard());
              })
            ],
          ),
        )),
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
