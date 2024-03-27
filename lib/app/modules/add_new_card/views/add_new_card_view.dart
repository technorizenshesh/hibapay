import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:hibapay/common/progress_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/add_new_card_controller.dart';

class AddNewCardView extends GetView<AddNewCardController> {
  const AddNewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CommonWidgets.appBar(title: StringConstants.addNewCard),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: ListView(
              children: [
                SizedBox(height: 20.px),
                CreditCardWidget(
                  padding: 0,
                  cardNumber: controller.cardNumber,
                  expiryDate: controller.expiryDate,
                  cardHolderName: controller.cardHolderName,
                  cvvCode: controller.cvvCode,
                  showBackView: false,
                  isChipVisible: true,
                  isHolderNameVisible: true,
                  chipColor: const Color(0xffE5AC3C),
                  backgroundImage: ImgConstants.imgCardBackGround,
                  onCreditCardWidgetChange: (creditCardBrand) {},
                ),
                SizedBox(height: 20.px),
                CreditCardForm(
                  cardNumber: controller.cardNumber,
                  expiryDate: controller.expiryDate,
                  cardHolderName: controller.cardHolderName,
                  cvvCode: controller.cvvCode,
                  onCreditCardModelChange: (creditCardModel) {
                    controller.cardNumber = creditCardModel.cardNumber;
                    controller.expiryDate = creditCardModel.expiryDate;
                    controller.cardHolderName = creditCardModel.cardHolderName;
                    controller.cvvCode = creditCardModel.cvvCode;
                    controller.isCvvFocused = creditCardModel.isCvvFocused;
                    controller.increment();
                  },
                  formKey: controller.formKey,
                  inputConfiguration: InputConfiguration(
                    cardNumberDecoration: CommonWidgets.inputDecoration(
                      labelText: 'Card Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: CommonWidgets.inputDecoration(
                      labelText: 'Expired Date',
                      hintText: 'MM/YY',
                    ),
                    cvvCodeDecoration: CommonWidgets.inputDecoration(
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: CommonWidgets.inputDecoration(
                      labelText: 'Card Holder Name',
                      hintText: 'Please enter the holder name',
                    ),
                  ),
                ),
                SizedBox(height: 10.px),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: TextField(
                    readOnly: true,
                    onTap: () => controller.clickOnCountryField(),
                    focusNode: controller.focusCountryOfResidence,
                    controller: controller.countryOfResidenceController,
                    decoration: CommonWidgets.inputDecoration(
                      labelText: StringConstants.countryOfResidence,
                      hintText: StringConstants.pleaseEnterCountryOfResidence,
                    ),
                  ),
                ),
                SizedBox(height: 40.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnSaveButton(),
                  child: Text(
                    StringConstants.save,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 10.px),
              ],
            ),
          ),
        ),
      );
    });
  }
}

/*      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.addNewCard),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.px),
              CommonWidgets.commonTextFieldForLoginSignUP(
                focusNode: controller.focusCardNumber,
                title: StringConstants.cardNumber,
                controller: controller.cardNumberController,
                isCard: controller.isCardNumber.value,
                hintText: StringConstants.enterDigitCardNumber,
              ),
              SizedBox(height: 14.px),
              Row(
                children: [
                  Expanded(
                    child: CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusMonth,
                      title: StringConstants.month,
                      controller: controller.monthController,
                      isCard: controller.isMonth.value,
                      hintText: StringConstants.monthOne,
                    ),
                  ),
                  SizedBox(width: 10.px),
                  Expanded(
                    child: CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusYear,
                      title: StringConstants.year,
                      controller: controller.yearController,
                      isCard: controller.isYear.value,
                      hintText: StringConstants.yearOne,
                    ),
                  ),
                  SizedBox(width: 10.px),
                  Expanded(
                    child: CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusCvv,
                      title: StringConstants.cvv,
                      controller: controller.cvvController,
                      isCard: controller.isCvv.value,
                      hintText: StringConstants.cvvOne,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.px),
              CommonWidgets.commonTextFieldForLoginSignUP(
                focusNode: controller.focusCardHoldersName,
                title: StringConstants.cardHoldersName,
                controller: controller.cardHoldersNameController,
                isCard: controller.isCardHoldersName.value,
                hintText: StringConstants.nameOnCard,
              ),
              SizedBox(height: 40.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnSaveButton(),
                child: Text(
                  StringConstants.save,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.px),
            ],
          ),
        ),
      );
*/
