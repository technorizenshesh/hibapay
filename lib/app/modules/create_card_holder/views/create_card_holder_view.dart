import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/create_card_holder_controller.dart';

class CreateCardHolderView extends GetView<CreateCardHolderController> {
  const CreateCardHolderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonMethods.unFocsKeyBoard(),
      child: Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.createCardHolder),
        body: Obx(() {
          controller.count.value;
          return ProgressBar(
            inAsyncCall: controller.inAsyncCall.value,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusFirstName,
                        title: StringConstants.firstName,
                        controller: controller.firstNameController,
                        isCard: controller.isFirstName.value,
                        hintText: StringConstants.pleaseEnterFirstName,
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusLastName,
                        title: StringConstants.lastName,
                        controller: controller.lastNameController,
                        isCard: controller.isLastName.value,
                        hintText: StringConstants.pleaseEnterLastName,
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusEmail,
                        title: StringConstants.email,
                        controller: controller.emailController,
                        isCard: controller.isEmail.value,
                        hintText: StringConstants.pleaseEnterEmail,
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusPhone,
                        title: StringConstants.phoneNumber,
                        controller: controller.phoneController,
                        isCard: controller.isPhone.value,
                        keyboardType: TextInputType.number,
                        hintText: StringConstants.pleaseEnterPhoneNumber,
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusAddress,
                        title: StringConstants.address,
                        controller: controller.addressController,
                        isCard: controller.isAddress.value,
                        hintText: StringConstants.pleaseEnterAddress,
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusState,
                        title: StringConstants.state,
                        controller: controller.stateController,
                        isCard: controller.isState.value,
                        hintText: StringConstants.pleaseEnterState,
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        readOnly: true,
                        onTap: () => controller.clickOnCountryField(),
                        focusNode: controller.focusCountry,
                        title: StringConstants.country,
                        controller: controller.countryController,
                        isCard: controller.isCountry.value,
                        hintText: StringConstants.pleaseEnterCountry,
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusPostalCode,
                        title: StringConstants.postalCode,
                        controller: controller.postalCodeController,
                        isCard: controller.isPostalCode.value,
                        hintText: StringConstants.pleaseEnterPostalCode,
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusBvn,
                        title: StringConstants.bvn,
                        controller: controller.bvnController,
                        isCard: controller.isBvn.value,
                        hintText: StringConstants.pleaseEnterBvn,
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnCreateButton(),
                        child: Text(
                          StringConstants.create,
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
              ],
            ),
          );
        }),
      ),
    );
  }
}
