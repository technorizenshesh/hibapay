import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../routes/app_pages.dart';
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
              /*showDialog(
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
                  return Scaffold(
                    appBar: CommonWidgets.appBar(
                      title: StringConstants.payNow,
                    ),
                    body: Column(children: [
                      ListTile(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.px),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.surface,
                            width: .4.px,
                          ),
                        ),
                        trailing: CommonMethods.appIcons(
                            assetName: IconConstants.icCheck),
                        subtitle: Text(
                          '**** **** **** 1121',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 12.px,
                                  ),
                        ),
                        title: Text(
                          'Abram Stanton',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context).primaryColor),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(24.px),
                          child: Image.asset(
                            'assets/images/img_logo.png',
                            height: 48.px,
                            width: 48.px,
                          ),
                        ),
                      ),
                      SizedBox(height: 14.px),
                      TextField(
                        controller: controller.amountController,
                        decoration: CommonWidgets.inputDecoration(
                          labelText: StringConstants.enterAmount,
                          hintText: StringConstants.pleaseEnterAccountName,
                        ),
                      ),
                      SizedBox(height: 14.px),
                      TextField(
                        controller: controller.addNotesController,
                        decoration: CommonWidgets.inputDecoration(
                          labelText: StringConstants.addNotes,
                          hintText: StringConstants.typeHere,
                        ),
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnPayNowButton(),
                        child: Text(
                          StringConstants.payNow,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ]),
                  );
                },
              ).whenComplete(() {
                controller.data.value = 0;
                controller.qrController?.resumeCamera();
              });*/
              Get.toNamed(Routes.PAY_AMOUNT);
              controller.data.value = 0;
              controller.qrController?.resumeCamera();
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
