import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
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
                                      'US Dollar ( \$ )',
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            // fontSize: 20.px,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                    ),
                                    const Spacer(),
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
                                            value: 'US  ( \$ )',
                                            child: Text(
                                              'US  ( \$ )',
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
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.px),
                                Text(
                                  '${CommonMethods.cur}12,256.00',
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 24.px,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                ),
                                SizedBox(height: 8.px),
                                Row(
                                  children: [
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
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () =>
                                          controller.clickOnReceivingAccount(),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.px),
                                        child: Row(
                                          children: [
                                            Text(
                                              StringConstants.receivingAccount,
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
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              size: 14.px,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.px),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Today, Mar 20',
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
                          /*Text(
                            StringConstants.allTransactions,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),*/
                        ],
                      ),
                    ),
                    SizedBox(height: 10.px),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.listOfTra.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          trailing: Text(
                            controller.listOfTra[index]['type'] == 'Withdraw'
                                ? '- ${CommonMethods.cur + controller.listOfTra[index]['amount']}'
                                : '+ ${CommonMethods.cur + controller.listOfTra[index]['amount']}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          subtitle: Text(
                            controller.listOfTra[index]['sub_title'],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 12.px,
                                ),
                          ),
                          title: Text(
                            controller.listOfTra[index]['title'],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          leading: CommonMethods.appIcons(
                              assetName: controller.listOfTra[index]['icon']),
                        );
                      },
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
