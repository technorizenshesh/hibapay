import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
  const TransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.transfers),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              Text(
                StringConstants.chooseCards,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 16.px, color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 8.px),
              SizedBox(
                height: 200.px,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listOfCard.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16.px),
                      child: Image.asset(
                        controller.listOfCard[index],
                        width: 280.px,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnSendMoneyByEmailButton(),
                child: Text(
                  StringConstants.sendMoneyByEmail,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 24.px),
              Text(
                StringConstants.chooseRecipients,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 16.px, color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 18.px),
              TextField(
                controller: controller.searchController,
                decoration: CommonWidgets.inputDecoration(
                  hintText: StringConstants.searchContacts,
                ),
              ),
              SizedBox(height: 18.px),
              SizedBox(
                height: 150.px,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.listOfCon.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => controller.clickOnCard(index: index),
                      child: Row(
                        children: [
                          Container(
                            width: 130.px,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.px),
                              gradient: controller.selectedCard.value == index
                                  ? CommonMethods.commonLinearGradientView()
                                  : CommonMethods
                                      .commonLinearGradientViewGrey(),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              margin: EdgeInsets.all(1.px),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.px),
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24.px),
                                    child: Image.asset(
                                      controller.listOfCon[index]['icon'],
                                      height: 48.px,
                                      width: 48.px,
                                    ),
                                  ),
                                  SizedBox(height: 10.px),
                                  Text(
                                    controller.listOfCon[index]['title'],
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontSize: 14.px,
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.px)
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 18.px),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.listOfCon.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: CommonMethods.appIcons(
                        assetName: IconConstants.icRightArrow),
                    subtitle: Text(
                      controller.listOfCon[index]['sub_title'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12.px,
                          ),
                    ),
                    title: Text(
                      controller.listOfCon[index]['title'],
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 14.px,
                              color: Theme.of(context).primaryColor),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(24.px),
                      child: Image.asset(
                        controller.listOfCon[index]['icon'],
                        height: 48.px,
                        width: 48.px,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 24.px),
            ],
          ),
        ),
      );
    });
  }
}
