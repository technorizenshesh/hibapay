import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/common/common_methods.dart';
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
                minimum: EdgeInsets.symmetric(vertical: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Text(
                        StringConstants.account,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              fontSize: 20.px,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
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
                                            '${CommonMethods.cur}12,256.00',
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
                                                value: 'US  ( \$ )',
                                                child: Text(
                                                  'US  ( \$ )',
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
                          height: 200.px,
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
                                        '${CommonMethods.cur}12,256.00',
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
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(children: [
                    SizedBox(height: 20.px),
                    Text(
                      StringConstants.totalSpending,
                      style: Theme.of(Get.context!).textTheme.titleMedium,
                    ),
                    SizedBox(height: 8.px),
                    Text(
                      '${CommonMethods.cur}5,215.00',
                      style: Theme.of(Get.context!)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 24.px,
                              color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 20.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.px),
                      child: SizedBox(
                        height: 200.px,
                        child: LineChart(
                          LineChartData(
                            lineTouchData: const LineTouchData(enabled: true),
                            gridData: const FlGridData(
                              show: false,
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 30,
                                  getTitlesWidget: bottomTitleWidgets,
                                  interval: 1,
                                ),
                              ),
                              leftTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            minX: 0,
                            maxX: 11,
                            minY: 0,
                            maxY: 6,
                            lineBarsData: [
                              LineChartBarData(
                                spots: const [
                                  FlSpot(0, 2.44),
                                  FlSpot(2.6, 1.44),
                                  FlSpot(4.9, 3.44),
                                  FlSpot(6.8, 2.44),
                                  FlSpot(8, 4.44),
                                  FlSpot(9.5, 0.44),
                                  FlSpot(11, 2.44),
                                ],
                                isCurved: true,
                                gradient: LinearGradient(
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter,
                                  colors: [
                                    Theme.of(Get.context!)
                                        .colorScheme
                                        .secondary,
                                    Theme.of(Get.context!)
                                        .colorScheme
                                        .onSecondary,
                                  ],
                                ),
                                barWidth: 3,
                                isStrokeCapRound: true,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: LinearGradient(
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter,
                                    colors: [
                                      Theme.of(Get.context!)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(.1.px),
                                      Theme.of(Get.context!)
                                          .colorScheme
                                          .onSecondary
                                          .withOpacity(.1.px),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
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
                          Text(
                            StringConstants.allTransactions,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.px),
                    ListView.builder(
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
