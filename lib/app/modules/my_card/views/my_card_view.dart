import 'package:HibaPay/app/data/constants/image_constants.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/my_card_controller.dart';

class MyCardView extends GetView<MyCardController> {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(
              title: StringConstants.myCard, wantBackButton: false),
          body: ListView(
            children: [
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
                            chipColor: const Color(0xffE5AC3C),
                            cardBgColor: hexToColor(
                                listVirtualCardsResult[index].vcardColor ?? ''),
                            // backgroundImage: ImgConstants.imgCardBackGround,
                            onCreditCardWidgetChange: (creditCardBrand) {},
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40.px,
                                width: 40.px,
                                margin: EdgeInsets.symmetric(vertical: 8.px),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.px),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40.px),
                                  child: Image.asset(
                                    ImgConstants.imgLogo,
                                    height: 34.px,
                                    width: 34.px,
                                    fit: BoxFit.cover,
                                  ),
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
              Center(
                child: InkWell(
                  onTap: () => controller.getCardHolderResult == null
                      ? controller.clickOnCreateVirtualCardHolder()
                      : controller.clickOnCreateVirtualCard(),
                  borderRadius: BorderRadius.circular(20.px),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.px),
                      border: Border.all(
                        color:
                            Theme.of(context).primaryColor.withOpacity(.4.px),
                        width: .4.px,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.px),
                      child: Text(
                        "+   ${controller.getCardHolderResult == null ? StringConstants.createVirtualCard : StringConstants.addNewCard}",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16.px,
                                color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.px),
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
