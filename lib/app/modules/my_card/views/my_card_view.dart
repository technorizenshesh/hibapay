import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/image_constants.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/modules/my_card/controllers/my_card_controller.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyCardView extends GetView<MyCardController> {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(
              title: StringConstants.cards, wantBackButton: false),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: (listVirtualCardsResult.isEmpty)
              ? null
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => controller.clickOnCreateVirtualCard(),
                      child: CommonMethods.appIcons(
                        width: 84.px,
                        height: 84.px,
                        assetName: IconConstants.icAdd,
                      ),
                    ),
                    SizedBox(height: 48.px),
                  ],
                ),
          body: ListView(
            children: [
              if (listVirtualCardsResult.isEmpty)
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.px, vertical: 4.px),
                  child: Column(
                    children: [
                      Image.asset(ImgConstants.imgManHoldingMoney,
                          height: 200.px),
                      SizedBox(height: 24.px),
                      Text(
                        controller.getCardHolderResult == null
                            ? StringConstants.createVirtualCard
                            : StringConstants.addVirtualCard,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16.px,
                                color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        controller.getCardHolderResult == null
                            ? StringConstants.instantlyAddVirtualCard
                            : StringConstants.instantlyCreateVirtualCard,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 14.px),
                      ),
                      SizedBox(height: 24.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.getCardHolderResult == null
                            ? controller.clickOnCreateVirtualCardHolder()
                            : controller.clickOnCreateVirtualCard(),
                        child: Text(
                          controller.getCardHolderResult == null
                              ? StringConstants.createVirtualCard
                              : StringConstants.addNewCard,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 24.px),
                    ],
                  ),
                ),
              if (listVirtualCardsResult.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listVirtualCardsResult.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.px, vertical: 4.px),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CreditCardWidget(
                            padding: 0,
                            cardNumber:
                                listVirtualCardsResult[index].vcardCardNumber ??
                                    '',
                            expiryDate:
                                '${listVirtualCardsResult[index].vcardExpiryMonth ?? ''}/${listVirtualCardsResult[index].vcardExpiryYear ?? ''}',
                            cardHolderName:
                                listVirtualCardsResult[index].vcardName ?? '',
                            cvvCode: 'XXXX',
                            showBackView: false,
                            isChipVisible: true,
                            isSwipeGestureEnabled: false,
                            isHolderNameVisible: true,
                            chipColor: hexToColor(
                                listVirtualCardsResult[index].vcardColor ?? ''),
                            //const Color(0xffE5AC3C),
                            obscureCardNumber: false,
                            cardBgColor: hexToColor(
                                listVirtualCardsResult[index].vcardColor ?? ''),
                            //backgroundImage: ImgConstants.imageBgWhiteLogo,
                            onCreditCardWidgetChange: (creditCardBrand) {},
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.px,
                                ),
                                child: Image.asset(
                                  ImgConstants.imgLogoWhite,
                                  height: 30.px,
                                  // width: 34.px,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => controller.clickOnDeleteButton(
                                    index: index),
                                child: Container(
                                  height: 40.px,
                                  width: 40.px,
                                  margin: EdgeInsets.all(8.px),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.px),
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  child: Icon(
                                    Icons.delete_outline_outlined,
                                    color: Theme.of(context).primaryColor,
                                    size: 20.px,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              SizedBox(height: 24.px),
              /* CommonWidgets.commonElevatedButton(
                onPressed: () => controller.getCardHolderResult == null
                    ? controller.clickOnCreateVirtualCardHolder()
                    : controller.clickOnCreateVirtualCard(),
                child: Text(
                  "+   ${controller.getCardHolderResult == null ? StringConstants.createVirtualCard : StringConstants.addNewCard}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 24.px),*/
            ],
          ),
        ),
      );
    });
  }

  Color hexToColor(String hexColor) {
    // Remove the '#' character if present
    hexColor = hexColor.replaceAll('#', '');

    // Parse the hex color code and return Color object
    return Color(int.parse('FF$hexColor', radix: 16));
  }
}
