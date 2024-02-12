import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/all_transactions_controller.dart';

class AllTransactionsView extends GetView<AllTransactionsController> {
  const AllTransactionsView({Key? key}) : super(key: key);

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
                          StringConstants.allTransactions,
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
                          padding: EdgeInsets.all(30.px),
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
                                Text(
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
