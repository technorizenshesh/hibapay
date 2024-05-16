import 'dart:ui';

import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/image_constants.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/modules/home/controllers/home_controller.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
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
                  result != null &&
                          result?.image != null &&
                          result!.image!.isNotEmpty &&
                          result!.image! !=
                              'https://hibapay.co/public/uploads/users/profile/'
                      ? CommonWidgets.imageView(
                          image: result?.image ?? '',
                          height: 48.px,
                          width: 48.px,
                          borderRadius: BorderRadius.circular(12.px),
                        )
                      : CommonWidgets.imageView(
                          image: ImgConstants.defaultNetworkImage,
                          height: 48.px,
                          width: 48.px,
                          borderRadius: BorderRadius.circular(12.px),
                        ),
                  SizedBox(width: 8.px),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringConstants.welcomeBack,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 4.px),
                        Text(
                          "${result?.firstName ?? ''} ${result?.lastName ?? ''}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 20.px,
                                  color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
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
            (controller.getBannersResult.isNotEmpty)
                ? CarouselSlider(
                    items: List.generate(
                      controller.getBannersResult.length,
                      (index) => ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            width: double.infinity,
                            height: 220.px,
                            padding: EdgeInsets.all(10.px),
                            child: CommonWidgets.imageView(
                                image: controller
                                        .getBannersResult[index].bannersImage ??
                                    '',
                                fit: BoxFit.contain),
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
                  )
                : CarouselSlider(
                    items: List.generate(
                      4,
                      (index) => ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            width: double.infinity,
                            height: 220.px,
                            padding: EdgeInsets.all(20.px),
                            child: CommonWidgets.shimmerView(),
                          ),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      height: 220.px,
                      onPageChanged: (index, reason) {
                        controller.cardIndex1.value = index;
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
            SizedBox(height: 4.px),
            (controller.getBannersResult.isNotEmpty)
                ? Align(
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
                                controller.getBannersResult.length,
                                (index) => Padding(
                                  padding: EdgeInsets.all(2.px),
                                  child: Center(
                                    child: Container(
                                      width: 6.px,
                                      height: 6.px,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.px),
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
                  )
                : Align(
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
                                4,
                                (index) => Padding(
                                  padding: EdgeInsets.all(2.px),
                                  child: Center(
                                    child: Container(
                                      width: 6.px,
                                      height: 6.px,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.px),
                                        gradient: controller.cardIndex1.value ==
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
            SizedBox(height: 24.px),
            (controller.getServicesResult.isNotEmpty)
                ? Center(
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: List.generate(
                            controller.getServicesResult.length, (index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 3.3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.px, vertical: 4.px),
                              child: InkWell(
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                borderRadius: BorderRadius.circular(8.px),
                                child: Container(
                                  height: 100.px,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.px, vertical: 14.px),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.px),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    /*border: Border.all(
                                width: .4.px,
                                color: Theme.of(context).colorScheme.surface,
                              ),*/
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonWidgets.imageView(
                                          image: controller
                                                  .getServicesResult[index]
                                                  .icon ??
                                              '',
                                          width: 24.px,
                                          height: 24.px,
                                          fit: BoxFit.contain,
                                          borderRadius:
                                              BorderRadius.circular(0.px)),
                                      SizedBox(height: 14.px),
                                      controller.getServicesResult[index]
                                                  .serviceNameCustom ==
                                              null
                                          ? CommonWidgets.shimmerView(
                                              height: 20.px)
                                          : Text(
                                              controller
                                                      .getServicesResult[index]
                                                      .serviceNameCustom ??
                                                  '',
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                    fontSize: 14.px,
                                                    color: Theme.of(context)
                                                        .primaryColor,
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
                  )
                : Center(
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: List.generate(9, (index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 3.3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.px, vertical: 4.px),
                              child: InkWell(
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                borderRadius: BorderRadius.circular(8.px),
                                child: Container(
                                  height: 100.px,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.px, vertical: 14.px),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.px),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    /*border: Border.all(
                                width: .4.px,
                                color: Theme.of(context).colorScheme.surface,
                              ),*/
                                  ),
                                  child: CommonWidgets.shimmerView(),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
            if (controller.getCardTransactionsResultData.isNotEmpty)
              SizedBox(height: 24.px),
            if (controller.getCardTransactionsResultData.isNotEmpty)
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
            if (controller.getCardTransactionsResultData.isNotEmpty)
              SizedBox(height: 20.px),
            if (controller.getCardTransactionsResultData.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.getCardTransactionsResultData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: Row(
                      children: [
                        Text(
                          controller.getCardTransactionsResultData[index]
                                      .type !=
                                  'credit'
                              ? '- '
                              : '+ ',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context).primaryColor),
                        ),
                        CommonMethods.iconLinearGradient(
                          assetName: IconConstants.icCur,
                          value: true,
                        ),
                        Text(
                          ' ${controller.getCardTransactionsResultData[index].amount ?? '0'}',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      controller
                              .getCardTransactionsResultData[index].datetime ??
                          '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12.px,
                          ),
                    ),
                    title: Text(
                      controller
                              .getCardTransactionsResultData[index].narration ??
                          '',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 14.px,
                              color: Theme.of(context).primaryColor),
                    ),
                    /*leading: CommonMethods.appIcons(
                          assetName: controller
                              .controller.getCardTransactionsResultData[index]['icon']),*/
                  );
                },
              ),
            SizedBox(height: 20.px),
          ],
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
