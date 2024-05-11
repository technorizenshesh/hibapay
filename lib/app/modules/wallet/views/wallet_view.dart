import 'dart:ui';

import 'package:HibaPay/common/globle.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topRight,
                    begin: Alignment.bottomLeft,
                    colors: [
                      Theme.of(Get.context!).colorScheme.secondary,
                      Theme.of(Get.context!).colorScheme.onSecondary,
                    ],
                  ),
                ),
                child: SafeArea(
                  bottom: false, // Do not apply padding at the bottom
                  minimum:
                      EdgeInsets.symmetric(vertical: 20.px, horizontal: 16.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /* GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CommonMethods.appIcons(
                              assetName: IconConstants.icBack,
                              height: 34.px,
                              width: 34.px,
                            ),
                          ),*/
                          Text(
                            StringConstants.wallet,
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 20.px,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                          ),
                          const SizedBox()
                        ],
                      ),
                      SizedBox(height: 20.px),
                      // if (listVirtualCardsResult.isNotEmpty)
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(18.px),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                end: Alignment.topRight,
                                begin: Alignment.bottomLeft,
                                colors: [
                                  Theme.of(Get.context!)
                                      .scaffoldBackgroundColor
                                      .withOpacity(.1),
                                  Theme.of(Get.context!)
                                      .scaffoldBackgroundColor
                                      .withOpacity(.1),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.px),
                              ),
                              border: Border.all(
                                width: .4.px,
                                color: Theme.of(Get.context!)
                                    .scaffoldBackgroundColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Nigeria  ',
                                        style: Theme.of(Get.context!)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              // fontSize: 20.px,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                      ),
                                      Text(
                                        '( ',
                                        style: Theme.of(Get.context!)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              // fontSize: 20.px,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                      ),
                                      CommonMethods.appIcons(
                                          assetName: IconConstants.icCur,
                                          width: 16.px,
                                          height: 16.px),
                                      Text(
                                        ' )',
                                        style: Theme.of(Get.context!)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              // fontSize: 20.px,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.px),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CommonMethods.appIcons(
                                          assetName: IconConstants.icCur),
                                      Text(
                                        '${(result != null && result?.wallet != null && result!.wallet!.isNotEmpty) ? result?.wallet : '0'}',
                                        style: Theme.of(Get.context!)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 24.px,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.px),
                                  Text(
                                    StringConstants.walletBalance,
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontSize: 12.px,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                  ),
                                  SizedBox(height: 8.px),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CommonMethods.appIcons(
                                        assetName: IconConstants.icGift,
                                        height: 24.px,
                                        width: 24.px,
                                      ),
                                      SizedBox(width: 2.px),
                                      Text(
                                        'HB${(result != null && result?.id != null && result!.id!.isNotEmpty) ? result?.id : '0'}',
                                        style: Theme.of(Get.context!)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              fontSize: 12.px,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => controller.clickOnFundWallet(),
                            borderRadius: BorderRadius.circular(24.px),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.px, vertical: 8.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.px),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonMethods.textViewLinearGradient(
                                      text: StringConstants.fundWallet,
                                      value: true),
                                  SizedBox(width: 8.px),
                                  CommonMethods.iconLinearGradient(
                                      assetName: IconConstants.icDeposit,
                                      value: true),
                                ],
                              ),
                            ),
                          ),
                          /* SizedBox(width: 10.px),
                        InkWell(
                          onTap: () => controller.clickOnWithdraw(),
                          borderRadius: BorderRadius.circular(24.px),
                          child: Container(
                            padding: EdgeInsets.all(8.px),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.px),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CommonMethods.textViewLinearGradient(
                                    text: StringConstants.withdraw,
                                    value: true),
                                SizedBox(width: 8.px),
                                CommonMethods.iconLinearGradient(
                                    assetName: IconConstants.icWithdraw,
                                    value: true),
                              ],
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: controller.getWalletTransactionResult.isNotEmpty
                    ? ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(height: 24.px),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.px),
                            child: Text(
                              'Transactions',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontSize: 14.px),
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(height: 8.px),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                controller.getWalletTransactionResult.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () =>
                                    controller.clickOnListTile(index: index),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      controller
                                              .getWalletTransactionResult[index]
                                              .walTraTransactionType ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 14.px,
                                              color: controller
                                                          .getWalletTransactionResult[
                                                              index]
                                                          .walTraTransactionType ==
                                                      'DEBIT'
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .error
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .onError),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          controller
                                                      .getWalletTransactionResult[
                                                          index]
                                                      .walTraTransactionType ==
                                                  'DEBIT'
                                              ? '- '
                                              : '+ ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 14.px,
                                                  color: controller
                                                              .getWalletTransactionResult[
                                                                  index]
                                                              .walTraTransactionType ==
                                                          'DEBIT'
                                                      ? Theme.of(context)
                                                          .colorScheme
                                                          .error
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onError),
                                        ),
                                        CommonMethods.appIcons(
                                            assetName: IconConstants.icCur,
                                            width: 14.px,
                                            height: 14.px,
                                            color: controller
                                                        .getWalletTransactionResult[
                                                            index]
                                                        .walTraTransactionType ==
                                                    'DEBIT'
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .error
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .onError),
                                        Text(
                                          controller
                                                          .getWalletTransactionResult[
                                                              index]
                                                          .walTraTransactionValue !=
                                                      null &&
                                                  controller
                                                      .getWalletTransactionResult[
                                                          index]
                                                      .walTraTransactionValue!
                                                      .isNotEmpty
                                              ? ' ${controller.getWalletTransactionResult[index].walTraTransactionValue ?? '0'}'
                                              : ' ${controller.getWalletTransactionResult[index].walTraTransactionValue ?? '0'}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 14.px,
                                                  color: controller
                                                              .getWalletTransactionResult[
                                                                  index]
                                                              .walTraTransactionType ==
                                                          'DEBIT'
                                                      ? Theme.of(context)
                                                          .colorScheme
                                                          .error
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onError),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  controller.getWalletTransactionResult[index]
                                          .walTraDescription ??
                                      controller
                                          .getWalletTransactionResult[index]
                                          .walTraServiceType ?? /*controller.getWalletTransactionResult[index]
                                          .walTraBuyDataReference ??*/
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 10.px),
                                ),
                                title: Text(
                                  controller.getWalletTransactionResult[index]
                                          .walTraMessage ?? /*controller.getWalletTransactionResult[index]
                                          .walTraBuyPostAccountNumber ??*/
                                      '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 12.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                                /*leading: CommonMethods.appIcons(
                                    assetName: controller
                              .controller.getWalletTransactionResult[index]['icon']),*/
                              );
                            },
                          ),
                          SizedBox(height: 60.px),
                        ],
                      )
                    : Center(child: CommonMethods.dataNotFound()),
              ),
            ],
          ),
        ),
      );
    });
  }
}
