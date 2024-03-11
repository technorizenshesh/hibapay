import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/app/data/constants/image_constants.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/gift_user_cards_controller.dart';

class GiftUserCardsView extends GetView<GiftUserCardsController> {
  const GiftUserCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.giftUser),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: SingleChildScrollView(
            child: Center(
              child: Wrap(
                children: List.generate(controller.list.length, (index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2.px,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.px, vertical: 4.px),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 180.px,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.px),
                                border: Border.all(
                                  width: .4.px,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                gradient: LinearGradient(
                                  end: Alignment.bottomRight,
                                  begin: Alignment.topLeft,
                                  colors: [
                                    /*Theme.of(Get.context!).colorScheme.secondary,
                                    Theme.of(Get.context!).colorScheme.onSecondary,*/
                                    generateRandomColor(),
                                    generateRandomColor(),
                                  ],
                                ),
                              ),
                              child: controller.list[index]['isOpen'] != 'yes'
                                  ? Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      margin: EdgeInsets.all(2.px),
                                      padding: EdgeInsets.all(2.px),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.px),
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            ImgConstants.imgGiftBox,
                                            height: 54.px,
                                            width: 54.px,
                                          ),
                                          SizedBox(height: 10.px),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CommonMethods.appIconsPng(
                                                    assetName: IconConstantsPng
                                                        .icCoin),
                                                SizedBox(width: 4.px),
                                                Text(
                                                  '10.00',
                                                  style: Theme.of(Get.context!)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                          fontSize: 20.px),
                                                ),
                                              ]),
                                          SizedBox(height: 10.px),
                                          Text(
                                            StringConstants.collect,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(fontSize: 14.px),
                                          ),
                                        ],
                                      ),
                                    )
                                  : null,
                            ),
                            if (controller.list[index]['isOpen'] == 'yes')
                              InkWell(
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                child: Container(
                                  padding: EdgeInsets.all(8.px),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color
                                        ?.withOpacity(.4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'TAP OPEN GIFT',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 14.px,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      );
    });
  }

  Color generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // red
      random.nextInt(256), // green
      random.nextInt(256), // blue
    );
  }
}
