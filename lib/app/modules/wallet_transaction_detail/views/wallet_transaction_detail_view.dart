import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/wallet_transaction_detail_controller.dart';

class WalletTransactionDetailView
    extends GetView<WalletTransactionDetailController> {
  const WalletTransactionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: (controller.inAsyncCall.value &&
            controller.getWalletTransactionResultData != null),
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar:
              CommonWidgets.appBar(title: StringConstants.transactionDetail),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.px),
            child: CommonWidgets.commonElevatedButton(
              onPressed: controller.clickOnDownloadButton,
              child: Text(
                StringConstants.download,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.px),
            child: controller.getWalletTransactionResultData != null
                ? ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(18.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.px),
                          gradient: LinearGradient(
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                            colors: [
                              Theme.of(Get.context!)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(.44),
                              Theme.of(Get.context!)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.44),
                            ],
                          ),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Token(s) available for this transaction',
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: 12.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(height: 8.px),
                              GestureDetector(
                                onTap: () => controller.clickOnView(),
                                child: CommonMethods.textViewLinearGradient(
                                    text: StringConstants.view),
                              )
                            ]),
                      ),
                      SizedBox(height: 14.px),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            CommonMethods.splashLogo(
                                height: 40.px, width: 100.px),
                            SizedBox(width: 10.px),
                            if (controller.getWalletTransactionResultData!
                                        .walTraBuyResource !=
                                    null &&
                                controller.getWalletTransactionResultData!
                                    .walTraBuyResource!.isNotEmpty)
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(4.px),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.px, horizontal: 8.px),
                                child: Text(
                                  controller.getWalletTransactionResultData!
                                          .walTraBuyResource ??
                                      '',
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontSize: 14.px),
                                ),
                              ),
                          ],
                        ),
                        trailing: Text(
                          controller.formatDate(controller
                                  .getWalletTransactionResultData!
                                  .walTraTransactionDate ??
                              ''),
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 30.px),
                      controller.listTileView(
                          title1: controller.getWalletTransactionResultData!
                                  .walTraBuyPostAccountNumber ??
                              '',
                          title: StringConstants.meterNumber,
                          trailing: StringConstants.reference,
                          trailing1: controller.getWalletTransactionResultData!
                                  .walTraBuyDataReference ??
                              ''),
                      SizedBox(height: 30.px),
                      controller.listTileView(
                        title1: controller.getWalletTransactionResultData!
                                .walTraTransactionType ??
                            '',
                        title: StringConstants.transactionType,
                        trailing: StringConstants.serviceType,
                        trailing1: controller.getWalletTransactionResultData!
                                .walTraServiceType ??
                            ''.replaceAll('_', ' '),
                      ),
                      SizedBox(height: 30.px),
                      controller.listTileView(
                          title1: controller.getWalletTransactionResultData!
                                  .walTraBuyDataCost ??
                              '',
                          title: StringConstants.byDataCost,
                          trailing: StringConstants.paymentStatus,
                          trailing1: controller.getWalletTransactionResultData!
                                  .walTraBuyDataPaymentStatus ??
                              ''),
                      SizedBox(height: 30.px),
                      controller.listTileView(
                          title1: controller.getWalletTransactionResultData!
                                  .walTraBuyStatus ??
                              '',
                          title: StringConstants.buyStatus,
                          trailing: StringConstants.message,
                          trailing1: controller.getWalletTransactionResultData!
                                  .walTraMessage ??
                              ''),
                      SizedBox(height: 30.px),
                      Text(
                        StringConstants.paymentBreakdown,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(height: 14.px),
                      if (controller
                                  .getWalletTransactionResultData!.walTraTransactionValue !=
                              null &&
                          controller.getWalletTransactionResultData!
                              .walTraTransactionValue!.isNotEmpty &&
                          controller.getWalletTransactionResultData!
                                  .walTraTransactionValue !=
                              '0')
                        listTileView1(
                            curValue: true,
                            title: StringConstants.amount,
                            trailing: controller.getWalletTransactionResultData!
                                    .walTraTransactionValue ??
                                '0'),
                      if (controller
                                  .getWalletTransactionResultData!.walTraTransactionValue !=
                              null &&
                          controller.getWalletTransactionResultData!
                              .walTraTransactionValue!.isNotEmpty &&
                          controller.getWalletTransactionResultData!
                                  .walTraTransactionValue !=
                              '0')
                        SizedBox(height: 10.px),
                      if (controller.getWalletTransactionResultData!
                                  .walTraTransactionAppFee !=
                              null &&
                          controller.getWalletTransactionResultData!
                              .walTraTransactionAppFee!.isNotEmpty &&
                          controller.getWalletTransactionResultData!
                                  .walTraTransactionAppFee !=
                              '0')
                        listTileView1(
                            curValue: true,
                            title: StringConstants.fee,
                            trailing: controller.getWalletTransactionResultData!
                                    .walTraTransactionAppFee ??
                                '0'),
                      if (controller.getWalletTransactionResultData!
                                  .walTraTransactionAppFee !=
                              null &&
                          controller.getWalletTransactionResultData!
                              .walTraTransactionAppFee!.isNotEmpty &&
                          controller.getWalletTransactionResultData!
                                  .walTraTransactionAppFee !=
                              '0')
                        SizedBox(height: 10.px),
                      listTileView1(
                          curValue: true,
                          title: StringConstants.total,
                          trailing: (double.parse(controller
                                          .getWalletTransactionResultData!
                                          .walTraTransactionValue ??
                                      '0') +
                                  double.parse(controller
                                          .getWalletTransactionResultData!
                                          .walTraTransactionAppFee ??
                                      '0'))
                              .toString()),
                      SizedBox(height: 30.px),
                    ],
                  )
                : Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24.px),
                            child: Image.asset(
                              'assets/images/img_logo.png',
                              height: 40.px,
                              width: 40.px,
                            ),
                          ),
                        ),
                        CircularProgressIndicator(
                          backgroundColor:
                              const Color(0xff7C7C7C).withOpacity(.01),
                          color: Theme.of(context).primaryColor,
                          strokeCap: StrokeCap.round,
                          strokeWidth: 4,
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      );
    });
  }

  Widget listTileView1(
      {required String trailing, required String title, bool? curValue}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
            fontSize: 14.px, color: Theme.of(Get.context!).primaryColor),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (curValue ?? false)
            CommonMethods.appIcons(
                height: 14.px,
                width: 14.px,
                assetName: IconConstants.icCur,
                color: Theme.of(Get.context!).textTheme.titleMedium?.color),
          Text(
            trailing,
            style: Theme.of(Get.context!)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
