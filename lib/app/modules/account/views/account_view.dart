import 'dart:ui';

import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

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
                  minimum: EdgeInsets.symmetric(vertical: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20.px),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: CommonMethods.appIcons(
                                assetName: IconConstants.icBack,
                                height: 34.px,
                                width: 34.px,
                              ),
                            ),
                            Text(
                              StringConstants.fund,
                              style: Theme.of(Get.context!)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 20.px,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                            ),
                            const SizedBox()
                          ],
                        ),
                      ),
                      SizedBox(height: 20.px),
                      /*CarouselSlider(
                      items: List.generate(
                        1,
                        (index) => ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20.px),
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
                                  Radius.circular(30.px),
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
                                    Text(
                                      StringConstants.currentBalance,
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            // fontSize: 20.px,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                    ),
                                    SizedBox(height: 8.px),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '₦12,256.00',
                                            maxLines: 1,
                                            style: Theme.of(Get.context!)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                  fontSize: 24.px,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                ),
                                          ),
                                        ),
                                        PopupMenuButton(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          offset: Offset(-34.px, 20.px),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.px)),
                                          elevation: .4.px,
                                          icon: Padding(
                                            padding: EdgeInsets.all(8.px),
                                            child: Row(
                                              children: [
                                                Text(
                                                  StringConstants.switchText,
                                                  style: Theme.of(Get.context!)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(
                                                        fontSize: 12.px,
                                                        color: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                      ),
                                                ),
                                                SizedBox(width: 2.px),
                                                CommonMethods.appIconsPng(
                                                  assetName:
                                                      IconConstantsPng.icSwitch,
                                                  width: 14.px,
                                                  height: 14.px,
                                                ),
                                              ],
                                            ),
                                          ),
                                          itemBuilder: (context) {
                                            return [
                                              PopupMenuItem(
                                                value: 'US  ( ₦ )',
                                                child: Text(
                                                  'US  ( ₦ )',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                          fontSize: 14.px),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: 'British  ( £ )',
                                                child: Text(
                                                  'British  ( £ )',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                          fontSize: 14.px),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: 'NGN  ( ₦ )',
                                                child: Text(
                                                  'NGN  ( ₦ )',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                          fontSize: 14.px),
                                                ),
                                              ),
                                            ];
                                          },
                                          onSelected: (value) =>
                                              controller.clickOnSwitch(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.px),
                                    Flexible(
                                      child: Text(
                                        '${StringConstants.bankAccount}2564  8546  8421  1121',
                                        style: Theme.of(Get.context!)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              fontSize: 10.px,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                      ),
                                    ),
                                    SizedBox(height: 20.px),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'IN ₦ 18,895 +',
                                              style: Theme.of(Get.context!)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontSize: 12.px,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                  ),
                                            ),
                                            SizedBox(height: 4.px),
                                            Text(
                                              'Out ₦ 20,895 -',
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
                                        ),
                                        GestureDetector(
                                          onTap: () =>
                                              controller.clickOnAddAccount(),
                                          child: CommonMethods.appIcons(
                                            assetName: IconConstants.icBank,
                                            height: 34.px,
                                            width: 34.px,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                        // aspectRatio: 16.px / 9.px,
                        height: 200.px,
                        onPageChanged: (index, reason) {
                          controller.cardIndex.value = index;
                        },
                        viewportFraction: 0.8.px,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                     SizedBox(height: 20.px),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(6.px),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.4.px),
                          borderRadius: BorderRadius.circular(12.px),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Wrap(
                              children: List.generate(
                                6,
                                (index) => Padding(
                                  padding: EdgeInsets.all(2.px),
                                  child: Center(
                                    child: Container(
                                      width: 8.px,
                                      height: 8.px,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.px),
                                        gradient: controller.cardIndex.value ==
                                                index
                                            ? CommonMethods
                                                .commonLinearGradientView()
                                            : CommonMethods
                                                .commonLinearGradientViewWhite(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    */
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            width: double.infinity,
                            height: 120.px,
                            margin: EdgeInsets.symmetric(horizontal: 20.px),
                            padding: EdgeInsets.all(20.px),
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
                                Radius.circular(30.px),
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
                                  Text(
                                    StringConstants.currentBalance,
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          // fontSize: 20.px,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                  ),
                                  SizedBox(height: 8.px),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '₦ ${controller.balance.isNotEmpty ? controller.balance.value : '0'}',
                                          maxLines: 1,
                                          style: Theme.of(Get.context!)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                fontSize: 24.px,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                              ),
                                        ),
                                      ),
                                      /*PopupMenuButton(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      offset: Offset(-34.px, 20.px),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.px)),
                                      elevation: .4.px,
                                      icon: Padding(
                                        padding: EdgeInsets.all(8.px),
                                        child: Row(
                                          children: [
                                            Text(
                                              StringConstants.switchText,
                                              style: Theme.of(Get.context!)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontSize: 12.px,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                  ),
                                            ),
                                            SizedBox(width: 2.px),
                                            CommonMethods.appIconsPng(
                                              assetName:
                                                  IconConstantsPng.icSwitch,
                                              width: 14.px,
                                              height: 14.px,
                                            ),
                                          ],
                                        ),
                                      ),
                                      itemBuilder: (context) {
                                        return [
                                          PopupMenuItem(
                                            value:
                                                'US  ( ₦ )',
                                            child: Text(
                                              'US  ( ₦ )',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(fontSize: 14.px),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: 'British  ( £ )',
                                            child: Text(
                                              'British  ( £ )',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(fontSize: 14.px),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: 'NGN  ( ₦ )',
                                            child: Text(
                                              'NGN  ( ₦ )',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(fontSize: 14.px),
                                            ),
                                          ),
                                        ];
                                      },
                                      onSelected: (value) =>
                                          controller.clickOnSwitch(),
                                    ),*/
                                    ],
                                  ),
                                  SizedBox(height: 8.px),
                                  Flexible(
                                    child: Text(
                                      '${StringConstants.virtualCardNumber}${listVirtualCardsResult.isNotEmpty ? listVirtualCardsResult.first.vcardCardNumber : 'Not added card please add'}',
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 10.px,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                    ),
                                  ),
                                  /* SizedBox(height: 20.px),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'IN ₦ 18,895 +',
                                          style: Theme.of(Get.context!)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontSize: 12.px,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                              ),
                                        ),
                                        SizedBox(height: 4.px),
                                        Text(
                                          'Out ₦ 20,895 -',
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
                                    ),
                                    */ /*GestureDetector(
                                      onTap: () =>
                                          controller.clickOnAddAccount(),
                                      child: CommonMethods.appIcons(
                                        assetName: IconConstants.icBank,
                                        height: 34.px,
                                        width: 34.px,
                                      ),
                                    ),*/ /*
                                  ],
                                ),*/
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
                            onTap: () => controller.clickOnDeposit(),
                            borderRadius: BorderRadius.circular(24.px),
                            child: Container(
                              padding: EdgeInsets.all(8.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.px),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonMethods.textViewLinearGradient(
                                      text: StringConstants.deposit,
                                      value: true),
                                  SizedBox(width: 8.px),
                                  CommonMethods.iconLinearGradient(
                                      assetName: IconConstants.icDeposit,
                                      value: true),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.px),
                          InkWell(
                            onTap: () => controller.clickOnWithdraw(),
                            borderRadius: BorderRadius.circular(24.px),
                            child: Container(
                              padding: EdgeInsets.all(8.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.px),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 20.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.px),
                      child: Row(
                        children: [
                          Text(
                            'Virtual Transactions',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    fontSize: 14.px),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.px),
                    (getCardTransactionsResultData.isNotEmpty)
                        ? ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: getCardTransactionsResultData.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                trailing: Text(
                                  getCardTransactionsResultData[index].type !=
                                          'credit'
                                      ? '- ${"₦${getCardTransactionsResultData[index].amount ?? '0'}"}'
                                      : '+ ${"₦${getCardTransactionsResultData[index].amount ?? '0'}"}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                                subtitle: Text(
                                  getCardTransactionsResultData[index]
                                          .datetime ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontSize: 12.px,
                                      ),
                                ),
                                title: Text(
                                  getCardTransactionsResultData[index]
                                          .narration ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                                /*leading: CommonMethods.appIcons(
                        assetName: controller
                            .getCardTransactionsResultData[index]['icon']),*/
                              );
                            },
                          )
                        : Center(child: CommonMethods.dataNotFound()),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('S', style: style);
        break;
      case 1:
        text = const Text('M', style: style);
        break;
      case 2:
        text = const Text('T', style: style);
        break;
      case 3:
        text = const Text('W', style: style);
        break;
      case 4:
        text = const Text('T', style: style);
        break;
      case 5:
        text = const Text('F', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
