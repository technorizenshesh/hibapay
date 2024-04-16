import 'dart:ui';

import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          backgroundColor:
              Theme.of(context).colorScheme.surface.withOpacity(.1.px),
          body: ListView(
            children: [
              SizedBox(height: 40.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CommonWidgets.imageView(
                          image: controller.result?.udocSelfyPhoto ?? '',
                          height: 40.px,
                          width: 40.px,
                          borderRadius: BorderRadius.circular(20.px),
                        ),
                        SizedBox(width: 8.px),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstants.welcomeBack,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 4.px),
                            Text(
                              "${controller.result?.firstName ?? ''} ${controller.result?.lastName ?? ''}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 20.px,
                                      color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => controller.clickOnSpinnerIcon(),
                          child: CommonMethods.appIcons(
                              assetName: IconConstants.icSpinner,
                              height: 48.px,
                              width: 48.px),
                        ),
                        SizedBox(width: 8.px),
                        GestureDetector(
                          onTap: () => controller.clickOnNotificationIcon(),
                          child: CommonMethods.appIcons(
                              assetName: IconConstants.icNotification,
                              height: 48.px,
                              width: 48.px),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 32.px),
              if (getBannersResult.isNotEmpty)
                CarouselSlider(
                  items: List.generate(
                    getBannersResult.length,
                    (index) => ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          width: double.infinity,
                          height: 220.px,
                          padding: EdgeInsets.all(20.px),
                          child: CommonWidgets.imageView(
                              image:
                                  getBannersResult[index].bannersImage ?? ''),
                        ),
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    height: 220.px,
                    onPageChanged: (index, reason) {
                      controller.cardIndex.value = index;
                    },
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1200),
                    autoPlayCurve: Curves.easeOutSine,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                  ),
                ),
              if (getBannersResult.isNotEmpty) SizedBox(height: 4.px),
              if (getBannersResult.isNotEmpty)
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.px),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 6.px, vertical: 4.px),
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).primaryColor.withOpacity(.2.px),
                        borderRadius: BorderRadius.circular(12.px),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Wrap(
                            children: List.generate(
                              getBannersResult.length,
                              (index) => Padding(
                                padding: EdgeInsets.all(2.px),
                                child: Center(
                                  child: Container(
                                    width: 6.px,
                                    height: 6.px,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.px),
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
                  ),
                ),
              /*Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.px),
                    bottomRight: Radius.circular(20.px),
                  ),
                  border: Border.all(
                    width: .2,
                    color: Theme.of(Get.context!).primaryColor.withOpacity(.2),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.px, horizontal: 10.px),
                  child: Column(
                    children: [
                      cards(
                          onTap: () => controller.clickOnDeposit(),
                          assetName: IconConstants.icDeposit,
                          title: StringConstants.deposit),
                      SizedBox(height: 18.px),
                      cards(
                          onTap: () => controller.clickOnTransfers(),
                          assetName: IconConstants.icTransfers,
                          title: StringConstants.transfers),
                      SizedBox(height: 18.px),
                      cards(
                          onTap: () => controller.clickOnWithdraw(),
                          assetName: IconConstants.icWithdraw,
                          title: StringConstants.withdraw),
                      SizedBox(height: 18.px),
                      cards(
                          onTap: () => controller.clickOnWallet(),
                          assetName: IconConstants.icWallet,
                          title: StringConstants.wallet),
                      SizedBox(height: 18.px),
                      cards(
                          onTap: () => controller.clickOnMore(),
                          assetName: IconConstants.icMore,
                          title: StringConstants.more),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.px),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 220.px,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.px),
                        child: Image.asset(
                          'assets/un_used_images/card1.png',
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),*/
              SizedBox(height: 24.px),
              if (getServicesResult.isNotEmpty)
                Center(
                  child: SingleChildScrollView(
                    child: Wrap(
                      children:
                          List.generate(getServicesResult.length, (index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 3.3,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.px, vertical: 4.px),
                            child: InkWell(
                              onTap: () => controller.clickOnCard(index: index),
                              borderRadius: BorderRadius.circular(8.px),
                              child: Container(
                                height: 100.px,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.px, vertical: 14.px),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.px),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  /*border: Border.all(
                                width: .4.px,
                                color: Theme.of(context).colorScheme.surface,
                              ),*/
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonWidgets.imageView(
                                        image:
                                            getServicesResult[index].icon ?? '',
                                        width: 24.px,
                                        height: 24.px,
                                        fit: BoxFit.contain,
                                        borderRadius:
                                            BorderRadius.circular(0.px)),
                                    SizedBox(height: 14.px),
                                    Text(
                                      getServicesResult[index]
                                              .serviceNameCustom ??
                                          '',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 14.px,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              /* SizedBox(height: 24.px),
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
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 14.px),
                        maxLines: 1,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(8.px),
                      onTap: () => controller.clickOnAllTransactions(),
                      child: Padding(
                        padding: EdgeInsets.all(8.px),
                        child: Text(
                          StringConstants.allTransactions,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
              if (getCardTransactionsResultData.isNotEmpty)
                SizedBox(height: 24.px),
              if (getCardTransactionsResultData.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                  child: Text(
                    'Virtual Transactions',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 14.px),
                    maxLines: 1,
                  ),
                ),
              if (getCardTransactionsResultData.isNotEmpty)
                SizedBox(height: 20.px),
              if (getCardTransactionsResultData.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: getCardTransactionsResultData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: Text(
                        getCardTransactionsResultData[index].type != 'credit'
                            ? '- ${"${CommonMethods.cur}${getCardTransactionsResultData[index].amount ?? '0'}"}'
                            : '+ ${"${CommonMethods.cur}${getCardTransactionsResultData[index].amount ?? '0'}"}',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor),
                      ),
                      subtitle: Text(
                        getCardTransactionsResultData[index].datetime ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 12.px,
                                ),
                      ),
                      title: Text(
                        getCardTransactionsResultData[index].narration ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor),
                      ),
                      /*leading: CommonMethods.appIcons(
                          assetName: controller
                              .getCardTransactionsResultData[index]['icon']),*/
                    );
                  },
                ),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }

  Widget cards(
      {required String assetName,
      required String title,
      GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CommonMethods.appIcons(
              assetName: assetName, height: 18.px, width: 18.px),
          SizedBox(height: 2.px),
          Text(
            title,
            style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                color: Theme.of(Get.context!).primaryColor, fontSize: 8.px),
          ),
        ],
      ),
    );
  }
}
