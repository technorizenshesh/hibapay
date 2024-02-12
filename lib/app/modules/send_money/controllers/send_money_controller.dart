import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class SendMoneyController extends GetxController {
  //TODO: Implement SendMoneyController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnSendMoneyButton() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 50.px, right: 16.px, left: 16.px),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.px)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.px),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(height: 40.px),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                StringConstants.from,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Bank of America',
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.px),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Tommy',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '**** 1121',
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.px),
                          child: Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(.4.px),
                            thickness: .8.px,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                StringConstants.to,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Citibank Online',
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.px),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Linda',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '**** 8456',
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.px),
                          child: Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(.4.px),
                            thickness: .8.px,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                StringConstants.total,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontSize: 16.px),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${CommonMethods.cur} 865.10',
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.px),
                        CommonWidgets.commonElevatedButton(
                          onPressed: () => clickOnOkSendNow(),
                          child: Text(
                            StringConstants.okSendNow,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.color
                        ?.withOpacity(0.1.px),
                    radius: 50.px,
                    child: Padding(
                      padding: EdgeInsets.all(1.px),
                      child: CommonMethods.appIcons(
                        assetName: IconConstants.icCard,
                        height: 88.px,
                        width: 88.px,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  clickOnOkSendNow() {
    Get.toNamed(Routes.SEND_MONEY_SUCCESSFULLY);
  }
}
