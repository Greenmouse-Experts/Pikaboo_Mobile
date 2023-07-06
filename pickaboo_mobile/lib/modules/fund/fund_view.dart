import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../data/constants.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class FundView extends ConsumerStatefulWidget {
  const FundView({super.key});

  @override
  ConsumerState<FundView> createState() => _FundViewConsumerState();
}

class _FundViewConsumerState extends ConsumerState<FundView> {
  TextEditingController fundController = TextEditingController();

  // final plugin = PaystackPlugin();
  // final publicKey = Constants.paystackPublicKey;

  @override
  void initState() {
    super.initState();
    //  plugin.initialize(publicKey: publicKey);
  }

  void _fundWallet() {
    final homeOwner = ref.watch(authProvider).user;
    final email = homeOwner?.email ?? 'greenmouseapp@gmail.com';

    if (fundController.text.isEmpty) {
      AppOverlays.showErrorSnackBar(
          context: context,
          message: 'Enter an amount to fund your wallet with');
      return;
    }

    final amount = int.parse(fundController.text) * 100;

    // Charge charge = Charge()
    //   ..amount = amount
    //   ..reference = 'TR-${DateTime.now().millisecondsSinceEpoch}'
    //   ..email = email
    //   ..currency = "NGN";

    // plugin
    //     .checkout(context,
    //         method: CheckoutMethod.card, charge: charge, fullscreen: true)
    //     .then((value) {
    //   if (value.status == true) {
    //     ref.read(authProvider.notifier).topupWallet(
    //         context: context,
    //         reference: value.reference ??
    //             'TR-${DateTime.now().millisecondsSinceEpoch}',
    //         ref: ref);
    //   } else {}
    // });
  }

  @override
  Widget build(BuildContext context) {
    final homeOwner = ref.watch(authProvider).user;
    final name = homeOwner?.firstName ?? '';
    final image = homeOwner?.avatar ?? '';
    final wallet = ref.watch(authProvider).wallet ?? '0.00';
    return Scaffold(
      appBar: customAppBar(context,
          implyLeading: true,
          hasElevation: false,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WalletCard(amount: wallet),
              AppTextField(
                label: 'min - 800',
                hasLabel: false,
                controller: fundController,
                keyboardType: TextInputType.number,
                hintText: 'Amount(NGN)',
              ),
              SizedBox(height: height(context) * 0.02),
              AppButton(text: 'Top Up Now', onPressed: _fundWallet),
              SizedBox(height: height(context) * 0.02),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImage(
                      imageWidth: 0.125,
                      imageHeight: 0.05,
                      image: 'assets/images/cards/master.png'),
                  AppImage(
                      imageWidth: 0.125,
                      imageHeight: 0.05,
                      image: 'assets/images/cards/verve.png'),
                  AppImage(
                      imageWidth: 0.125,
                      imageHeight: 0.05,
                      image: 'assets/images/cards/visa.png'),
                ],
              ),
              SizedBox(height: height(context) * 0.02),
              Text('Terms & Conditions',
                  style: medium13(context).copyWith(color: AppColors.primary)),
              SizedBox(height: height(context) * 0.02),
              const TermsCard(
                question: 'Payment Terms & Refund Policy',
                answer:
                    '    All payments on this platform are as advised by the subscribing local Waste Management Authority through designated personal User wallets from which levies will be swept to service providers. In addition to monthly levies, subscribers will be charged separately, additional fees for special service clearance calls and standard Bin request. No refund shall be due to registered users of this App as it applies to their existing monthly waste levies unless advised otherwise by the local Authority.',
              ),
              // ListView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: 4,
              //     itemBuilder: (context, i) {
              //       return ListTile(
              //           minLeadingWidth: 10,
              //           leading: Text('${i + 1} .',
              //               style: medium13(context).copyWith(
              //                   color: Colors.black.withOpacity(0.4))),
              //           title: Text(
              //               'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eros ligula, rutrum imperdiet ',
              //               style: medium13(context).copyWith(
              //                   color: Colors.black.withOpacity(0.4))));
              //     })
            ],
          ),
        )),
      ),
    );
  }
}
