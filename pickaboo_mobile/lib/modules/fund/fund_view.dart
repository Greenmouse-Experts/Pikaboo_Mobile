import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class FundView extends StatefulWidget {
  const FundView({super.key});

  @override
  State<FundView> createState() => _FundViewState();
}

class _FundViewState extends State<FundView> {
  TextEditingController fundController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          implyLeading: true,
          hasElevation: false,
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
              const WalletCard(),
              AppTextField(
                label: 'min - 800',
                hasLabel: false,
                controller: fundController,
                keyboardType: TextInputType.number,
                hintText: 'Amount(NGN)',
              ),
              SizedBox(height: height(context) * 0.02),
              AppButton(
                  text: 'Top Up Now',
                  onPressed: () {
                    context.pushReplacementNamed(AppRouter.fundStatus);
                  }),
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
