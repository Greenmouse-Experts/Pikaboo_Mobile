import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../controllers/driver_requests/driver_request_controller.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class QrCodeScanView extends ConsumerStatefulWidget {
  final String cleanupId;
  final bool isScheduled;
  const QrCodeScanView(
      {super.key, required this.cleanupId, required this.isScheduled});

  @override
  ConsumerState<QrCodeScanView> createState() => _QrCodeScanViewConsumerState();
}

class _QrCodeScanViewConsumerState extends ConsumerState<QrCodeScanView> {
  bool _canSubmit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(context, actions: [], hasElevation: false),
      body: Padding(
        padding: screenPadding(context),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Text(
                    "Place the QR Code in the area below",
                    style: medium18(context),
                  ),
                  SizedBox(height: height(context) * 0.01),
                  Text(
                    "Scanning will begin automatically",
                    style:
                        regular15(context).copyWith(color: AppColors.darkAsh),
                  )
                ],
              )),
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: MobileScannerController(
                        detectionSpeed: DetectionSpeed.normal,
                        facing: CameraFacing.back,
                        torchEnabled: false,
                      ),
                      onDetect: (barcode) {
                        try {
                          if (!_canSubmit) {
                            //     var theBars = barcode.barcodes;
                            var ddatata = barcode.barcodes;
                            
                             for (final barcode in ddatata) {
                              debugPrint('Barcode found! ${barcode.rawValue}');
                            }

                            final residenceId =
                                ddatata[0].url?.url?.split("sort=").last;
                                print("======s=sffs$residenceId");

                            _canSubmit = true;
                            if (widget.isScheduled) {
                              ref
                                  .read(driverRequestProvider.notifier)
                                  .completeCleanUp(
                                      ref: ref,
                                      context: context,
                                      cleanupId: widget.cleanupId,
                                      residenceId: residenceId.toString());
                            } else {
                              // Handle the case when widget.isScheduled is false
                            }
                          }
                        } catch (e) {
                          print("Error during QR code processing: $e");
                          // Handle the error, show a message, or take appropriate action
                        }
                      },
                    ),
                    const QRScannerOverlay(overlayColour: AppColors.altWhite)
                  ],
                ),
              ),
              Expanded(
                  child: Center(
                child: Text(
                    "This process is automatic, Kindly place camera in front of home residents qr code",
                    textAlign: TextAlign.center,
                    style: medium15(context)),
              ))
              // Expanded(
              //     child: Center(
              //         child: AppButton(
              //             text: "Submit",
              //             onPressed: () {
              //               _canSubmit ? submit() : canNotSubmit();
              //             })))
            ],
          ),
        ),
      ),
    );
  }
}
