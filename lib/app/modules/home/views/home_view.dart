import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                GestureDetector(
                  onTap: () => controller.clickOnNotificationIcon(),
                  child: CommonMethods.appIcons(
                      assetName: IconConstants.icNotification,
                      height: 48.px,
                      width: 48.px),
                )
              ],
            ),
          ),
          SizedBox(height: 32.px),
          Row(
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
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
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
  }

  Widget cards({required String assetName, required String title, GestureTapCallback? onTap}) {
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
