import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/app/data/constants/image_constants.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/spinner_controller.dart';

class SpinnerView extends GetView<SpinnerController> {
  const SpinnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.hibaSpin),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              children: [
                SizedBox(height: 40.px),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 300.px,
                        height: 300.px,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150.px),
                          border: Border.all(
                            color: const Color(
                                0xffE89600), // Choose your border color
                            width: 8.px, // Choose your border width
                          ),
                        ),
                        child: FortuneWheel(
                          selected: controller.selected.stream,
                          onFocusItemChanged: (value) =>
                              controller.onFocusItemChanged(value: value),
                          indicators: [
                            FortuneIndicator(
                              alignment: Alignment.topCenter,
                              child: TriangleIndicator(
                                  elevation: 0,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                            ),
                          ],
                          items: [
                            for (int i = 0; controller.items.length > i; i++)
                              FortuneItem(
                                style: FortuneItemStyle(
                                  color: generateRandomColor(),
                                  // colorValue(i),
                                  borderWidth: 0,
                                ),
                                child: Text(
                                  controller.items[i],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              )
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.px),
                        child: Image.asset(
                          ImgConstants.imageBgWhiteLogo,
                          height: 60.px,
                          width: 60.px,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.px),
                Text(
                  StringConstants.youWin,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 24.px),
                ),
                SizedBox(height: 8.px),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonMethods.appIconsPng(
                      assetName: IconConstantsPng.icCoin,
                    ),
                    SizedBox(width: 4.px),
                    Text(
                      controller.coins.value,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 24.px,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 8.px),
                Image.asset(
                  ImgConstants.imgSpinnerPage,
                  height: 220.px,
                  width: 220.px,
                ),
                SizedBox(height: 14.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnSpinToAgainButton(),
                  child: Text(
                    StringConstants.spinToAgain,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 40.px),
              ],
            ),
          ),
        ],
      ),
    );
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

  Color colorValue(int i) {
    switch (i) {
      case 1:
        return const Color(0xffF5B133);
      case 4:
        return const Color(0xffF5B133);
      case 7:
        return const Color(0xffF5B133);
      case 10:
        return const Color(0xffF5B133);
      case 2:
        return const Color(0xff076CE3);
      case 5:
        return const Color(0xff076CE3);
      case 8:
        return const Color(0xff076CE3);
      case 11:
        return const Color(0xff076CE3);
      default:
        return const Color(0xffDE0D27);
    }
  }
}
