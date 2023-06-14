import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class MarketPlaceView extends ConsumerWidget {
  const MarketPlaceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar3(context, hasElevation: false, actions: [
        CircleAvatar(
          radius: width(context) * 0.04,
          backgroundColor: AppColors.lightAsh,
          child: Image.asset('assets/images/dummy_icon.png', fit: BoxFit.cover),
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
                    itemBuilder: (context, i) =>
                        CategorySelector(isSelected: i == 0)),
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
                          size: width(context) * 0.05,
                        ),
                        label: Text(
                          'Save',
                          style: regular11(context),
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
