import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/scan_qr_code_controller.dart';

class ScanQrCodeView extends GetView<ScanQrCodeController> {
  const ScanQrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _buildQrView(context),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 20.px),
                InkWell(
                  onTap: () async {
                    await controller.qrController?.toggleFlash();
                    controller.flashValue.value =
                        (await controller.qrController?.getFlashStatus())!;
                    controller.increment();
                  },
                  child: Obx(
                    () => Container(
                      height: 54.px,
                      width: 54.px,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(.4.px),
                        borderRadius: BorderRadius.circular(30.px),
                      ),
                      child: Icon(
                        controller.flashValue.value
                            ? Icons.flash_on
                            : Icons.flash_off,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.px),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: controller.qrKey,
      onQRViewCreated: (p0) {
        controller.qrController = p0;
        p0.scannedDataStream.listen((scanData) {
          controller.result = scanData;
          controller.increment();
          if (controller.result != null) {
            controller.data.value++;
            if (controller.data.value == 1) {
              controller.qrController?.pauseCamera();
              controller.qrController?.resumeCamera();

              /* showDialog(
                context: context,
                builder: (context) {
                  Uri uri = Uri.parse(controller.result!.code != null
                      ? controller.result!.code!
                      : '');
                  Map<String, List<String>> queryParams =
                      uri.queryParametersAll;
                  queryParams.forEach((key, value) {
                    print("$key: ${value.join(', ')}");
                    print("Parameter Values:$queryParams");
                  });
                  return (controller.result != null)
                      ? Obx(() {
                          controller.count.value;
                          return Container(
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10.px)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Barcode Type: ${describeEnum(controller.result!.format)}   Data: ${controller.result!.code}'),
                            ),
                          );
                        })
                      : const SizedBox();
                },
              ).whenComplete(() {
                controller.data.value = 0;
              });*/
            }
          }
        });
      },
      overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).primaryColor,
          borderRadius: 10.px,
          borderLength: 30.px,
          borderWidth: 10.px),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
