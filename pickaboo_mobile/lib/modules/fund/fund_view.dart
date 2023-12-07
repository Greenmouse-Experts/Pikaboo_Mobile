import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
// // Import for Android features.
// import 'package:webview_flutter/webview_flutter.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../data/constants.dart';
import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class FundView extends ConsumerStatefulWidget {
  const FundView({super.key});

  @override
  ConsumerState<FundView> createState() => _FundViewConsumerState();
}

class _FundViewConsumerState extends ConsumerState<FundView> {
  TextEditingController fundController = TextEditingController();

  final plugin = PaystackPlugin();
  final publicKey = Constants.paystackPublicKey;

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey);
  }

  Future<PaystackSchema> createAccessCode(amount, reference, email) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Constants.paystackSecretkey}'
    };
    Map data = {"amount": amount, "email": email, "reference": reference};
    String payload = json.encode(data);
    http.Response response = await http.post(
        Uri.parse('https://api.paystack.co/transaction/initialize'),
        headers: headers,
        body: payload);
    final newdata = jsonDecode(response.body);

    final schema = PaystackSchema.fromJson(newdata['data']);

    return schema;
  }

  void _fundWallet() async {
    final homeOwner = ref.watch(authProvider).user;
    final email = homeOwner?.email ?? 'greenmouseapp@gmail.com';

    if (fundController.text.isEmpty) {
      AppOverlays.showErrorSnackBar(
          context: context,
          message: 'Enter an amount to fund your wallet with');
      return;
    }

    final amount = int.parse(fundController.text) * 100;

    Charge charge = Charge()
      ..amount = amount
      ..reference = 'TR-${DateTime.now().millisecondsSinceEpoch}'
      ..email = email
      ..currency = "NGN";
    AppOverlays.loadingDialog(context: context);
    createAccessCode(amount, charge.reference, email).then((value) {
      context.pop();
      charge.accessCode = value.accessCode;
    }).then((_) {
      plugin
          .checkout(context,
              method: CheckoutMethod.selectable,
              charge: charge,
              fullscreen: true,
              logo: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/images/pickaboo_logo.png')))
          .then((value) {
        log(value.toString());
        // print("Payment Status: ${value.status}");
        // print("Payment Reference: ${value.reference}");
        // print("Payment Message: ${value.message}");

        fundController.clear();
        FocusManager.instance.primaryFocus?.unfocus();
        if (value.status == true) {
          ref.read(authProvider.notifier).topupWallet(
              context: context,
              reference: value.reference ??
                  'TR-${DateTime.now().millisecondsSinceEpoch}',
              ref: ref);
        } else {
          AppOverlays.showErrorSnackBar(
              context: context, message: 'Payment was unsuccessful');
        }
      });
    });
  }

  // _showPaystack() async {
  //   final homeOwner = ref.watch(authProvider).user;
  //   final email = homeOwner?.email ?? 'greenmouseapp@gmail.com';

  //   if (fundController.text.isEmpty) {
  //     AppOverlays.showErrorSnackBar(
  //         context: context,
  //         message: 'Enter an amount to fund your wallet with');
  //     return;
  //   }
  //   final amount = int.parse(fundController.text) * 100;
  //   final reference = 'TR-${DateTime.now().millisecondsSinceEpoch}';
  //   final paySchema = await createAccessCode(amount, reference, email);
  //   // This awaits the [authorization_url](#authUrl). NB: I'm using the MVVM architecture in my live code, but it's still the same process of retrieving the authURL.
  //   //  var authUrl = await _profileCtrl.paystackWebViewChargeCard(data);

  //   final controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setBackgroundColor(const Color(0x00000000))
  //     ..setNavigationDelegate(
  //       NavigationDelegate(
  //         onProgress: (int progress) {
  //           // Update loading bar.
  //         },
  //         onPageStarted: (String url) {},
  //         onPageFinished: (String url) {},
  //         onWebResourceError: (WebResourceError error) {},
  //         onNavigationRequest: (NavigationRequest request) {
  //           if (request.url == "https://standard.paystack.co/close" ||
  //               request.url == Constants.callBackUrl) {
  //             Navigator.pop(context);
  //             ref.read(authProvider.notifier).topupWallet(
  //                 context: context, reference: paySchema.reference, ref: ref);
  //           }
  //           return NavigationDecision.navigate;
  //         },
  //       ),
  //     )
  //     ..loadRequest(Uri.parse(paySchema.authorizationUrl));

  //   pay(controller);
  // }

  // void pay(WebViewController controller) {
  //   showGeneralDialog(
  //       context: context,
  //       barrierDismissible: true,
  //       barrierLabel:
  //           MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //       barrierColor: Colors.black45,
  //       transitionDuration: const Duration(milliseconds: 200),
  //       pageBuilder: (BuildContext buildContext, Animation animation,
  //           Animation secondaryAnimation) {
  //         return Column(
  //           children: [
  //             customAppBar5(context,
  //                 actions: [NavigationControls(controller: controller)]),
  //             Center(
  //                 child: Container(
  //               width: MediaQuery.of(context).size.width - 10,
  //               // height: MediaQuery.of(context).size.height - 80,
  //               height: adjustedHeight(context),
  //               padding: const EdgeInsets.only(top: 40),
  //               color: Colors.white,
  //               child: WebViewWidget(
  //                 controller: controller,
  //               ),
  //             )),
  //           ],
  //         );
  //       });
  // }

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
            AppBarIcon(name: name, image: image),
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
