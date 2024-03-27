import 'dart:async';
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
    return Obx(() {
      controller.count.value;
      return AbsorbPointer(
        absorbing: controller.absorbing.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(title: StringConstants.hibaSpin),
          backgroundColor: Colors.red,
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
                          FortuneWheel(
                            onAnimationEnd: () {
                              print('co::::::::::::::::::${controller.coins}');
                              controller.increment();
                            },
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.px),
                            child: Image.asset(
                              ImgConstants.imageBgWhiteLogo,
                              height: 80.px,
                              width: 80.px,
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
                        Obx(() {
                          controller.count.value;
                          return Text(
                            controller.coins.value,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 24.px,
                                ),
                          );
                        }),
                      ],
                    ),
                    /* SizedBox(height: 8.px),
                  Image.asset(
                    ImgConstants.imgSpinnerPage,
                    height: 180.px,
                    width: 180.px,
                  ),*/
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnSpinAgainButton(),
                      child: Text(
                        StringConstants.spinAgain,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
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

/*class SpinnerViewSTF extends StatefulWidget {
  const SpinnerViewSTF({super.key});

  @override
  State<SpinnerViewSTF> createState() => _SpinnerViewSTFState();
}

class _SpinnerViewSTFState extends State<SpinnerViewSTF> {
  bool absorbing = false;
  StreamController<int> selected = StreamController<int>();
  String coins = "0";
  final items = <String>[
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100',
    '110',
    '120',
  ];

  clickOnSpinAgainButton() {
    absorbing = true;
    setState(() {});
    selected.add(
      Fortune.randomInt(0, items.length),
    );
    absorbing = false;
    setState(() {});
  }

  onFocusItemChanged({required int value}) {
    coins = items[value].toString();
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

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbing,
      child: Scaffold(
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
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width / 2),
                            border: Border.all(
                              color: const Color(0xffE89600),
                              width: 8.px,
                            ),
                          ),
                          child: FortuneWheel(
                            selected: selected.stream,
                            onFocusItemChanged: (value) =>
                                onFocusItemChanged(value: value),
                            onAnimationEnd: () {
                              setState(() {
                                ;
                              });
                            },
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
                              for (int i = 0; items.length > i; i++)
                                FortuneItem(
                                  style: FortuneItemStyle(
                                    color: generateRandomColor(),
                                    // colorValue(i),
                                    borderWidth: 0,
                                  ),
                                  child: Text(
                                    items[i],
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
                          borderRadius: BorderRadius.circular(24.px),
                          child: Image.asset(
                            ImgConstants.imageBgWhiteLogo,
                            height: 48.px,
                            width: 48.px,
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
                        coins,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 24.px,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.px),
                  Image.asset(
                    ImgConstants.imgSpinnerPage,
                    height: 180.px,
                    width: 180.px,
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => clickOnSpinAgainButton(),
                    child: Text(
                      StringConstants.spinAgain,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

class SpinnerViewSTF extends StatefulWidget {
  const SpinnerViewSTF({super.key});

  @override
  State<SpinnerViewSTF> createState() => _SpinnerViewSTFState();
}

class _SpinnerViewSTFState extends State<SpinnerViewSTF> {
  bool absorbing = false;
  StreamController<int> selected = StreamController<int>();
  String coins = "0";
  final items = <String>[
    '10',
    '20',
    '30',
    '40',
    '50',
    '90',
    '80',
    '60',
    '70',
  ];

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

  clickOnSpinAgainButton() {
    absorbing = true;
    setState(() {});
    selected.add(
      Fortune.randomInt(0, items.length),
    );
    absorbing = false;
    setState(() {});
  }

  onFocusItemChanged({required int value}) {
    coins = items[value].toString();
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

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbing,
      child: Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.hibaSpin),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20.px),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width / 2),
                            /*border: Border.all(
                              color: const Color(0xffE89600),
                              width: 8.px,
                            ),*/
                          ),
                          child: FortuneWheel(
                            hapticImpact: HapticImpact.light,
                            selected: selected.stream,
                            onFling: () {
                              print('onFling:::::::::::::::::::::');
                            },
                            onFocusItemChanged: (value) =>
                                onFocusItemChanged(value: value),
                            onAnimationEnd: () {
                              setState(() {});
                              print('onAnimationEnd:::::::::::::::::::::');
                            },
                            indicators: [
                              /*FortuneIndicator(
                                alignment: Alignment.topCenter,
                                child: TriangleIndicator(
                                    elevation: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                              ),*/
                            ],
                            items: [
                              for (int i = 0; items.length > i; i++)
                                FortuneItem(
                                  style: FortuneItemStyle(
                                    color: colorValue(i),
                                    // colorValue(i),
                                    borderWidth: 0,
                                  ),
                                  child: Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Transform.rotate(
                                          angle: 3.4,
                                          child: Text(
                                            items[i],
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.fade,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                        ),
                                        SizedBox(width: 10.px),
                                        CommonMethods.appIconsPng(
                                          assetName: IconConstantsPng.icCoin,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.px),
                          child: Image.asset(
                            ImgConstants.imageSpinnerIndicator,
                            height: 50.px,
                            width: 50.px,
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
                        coins,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 24.px,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => clickOnSpinAgainButton(),
                    child: Text(
                      StringConstants.spinAgain,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
