import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/app/data/constants/image_constants.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/string_constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.px),
                        child: Image.asset(
                          ImgConstants.imgLogo,
                          height: 40.px,
                          width: 40.px,
                          fit: BoxFit.cover,
                        ),
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
                            'Marilyn Stanton',
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: CarouselSlider(
                items: List.generate(
                  6,
                  (index) => ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.px),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/un_used_images/image_banner.png')),
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
                      ),
                    ),
                  ),
                ),
                options: CarouselOptions(
                  // height: 320.px,
                  onPageChanged: (index, reason) {
                    controller.cardIndex.value = index;
                  },
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                  autoPlayCurve: Curves.easeOutSine,
                  scrollDirection: Axis.horizontal,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                ),
              ),
            ),
            SizedBox(height: 4.px),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 6.px, vertical: 4.px),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.2.px),
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
                                width: 6.px,
                                height: 6.px,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.px),
                                  gradient: controller.cardIndex.value == index
                                      ? CommonMethods.commonLinearGradientView()
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
            Center(
              child: SingleChildScrollView(
                child: Wrap(
                  children: List.generate(controller.list.length, (index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 4.3,
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
                              border: Border.all(
                                width: .4.px,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonMethods.appIconsPng(
                                  assetName: controller.list[index]['icon'],
                                  width: 24.px,
                                  height: 24.px,
                                ),
                                SizedBox(height: 14.px),
                                Text(
                                  controller.list[index]['title'],
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context).primaryColor,
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
            SizedBox(height: 24.px),
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
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px, color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text(
                    controller.listOfTra[index]['sub_title'],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 12.px,
                        ),
                  ),
                  title: Text(
                    controller.listOfTra[index]['title'],
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px, color: Theme.of(context).primaryColor),
                  ),
                  leading: CommonMethods.appIcons(
                      assetName: controller.listOfTra[index]['icon']),
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
