import 'dart:io';

import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            appBar: CommonWidgets.appBar(title: StringConstants.editProfile),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.px),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            (controller.image.value != null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(60.px),
                                    ),
                                    child: Image.file(
                                      height: 120.px,
                                      width: 120.px,
                                      fit: BoxFit.cover,
                                      File(
                                        controller.image.value!.path.toString(),
                                      ),
                                    ),
                                  )
                                : result != null &&
                                        result?.image != null &&
                                        result!.image!.isNotEmpty &&
                                        result!.image! !=
                                            'https://hibapay.co/public/uploads/users/profile/'
                                    ? CommonWidgets.imageView(
                                        image: result?.image ?? '',
                                        height: 120.px,
                                        width: 120.px,
                                        borderRadius:
                                            BorderRadius.circular(60.px),
                                      )
                                    : CommonWidgets.imageView(
                                        image: ImgConstants.defaultNetworkImage,
                                        height: 120.px,
                                        width: 120.px,
                                        borderRadius:
                                            BorderRadius.circular(60.px),
                                      ),
                            SizedBox(
                              width: 34.px,
                              height: 34.px,
                              child: FloatingActionButton(
                                onPressed: () =>
                                    controller.clickOnChangeProfilePicture(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.px),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusFullName,
                          title: StringConstants.fullName,
                          controller: controller.fullNameController,
                          isCard: controller.isFullName.value,
                          prefixIcon: CommonMethods.appIcons(
                            assetName: controller.isFullName.value
                                ? IconConstants.icUserActive
                                : IconConstants.icUserInActive,
                          ),
                          hintText: StringConstants.pleaseEnterFullName,
                        ),
                        SizedBox(height: 14.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusStreetAddress,
                          title: StringConstants.streetAddress,
                          controller: controller.streetAddressController,
                          isCard: controller.isStreetAddress.value,
                          prefixIcon: CommonMethods.appIcons(
                            assetName: controller.isStreetAddress.value
                                ? IconConstants.icStreetAddressActive
                                : IconConstants.icStreetAddressInActive,
                          ),
                          hintText: StringConstants.pleaseEnterStreetAddress,
                        ),
                        SizedBox(height: 14.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusCity,
                          title: StringConstants.city,
                          controller: controller.cityController,
                          isCard: controller.isCity.value,
                          prefixIcon: CommonMethods.appIcons(
                            assetName: controller.isCity.value
                                ? IconConstants.icCityActive
                                : IconConstants.icCityInActive,
                          ),
                          hintText: StringConstants.pleaseEnterCity,
                        ),
                        SizedBox(height: 14.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          readOnly: true,
                          onTap: () => controller.clickOnCountryField(),
                          focusNode: controller.focusCountryOfResidence,
                          title: StringConstants.countryOfResidence,
                          controller: controller.countryOfResidenceController,
                          isCard: controller.isCountryOfResidence.value,
                          prefixIcon: CommonMethods.appIcons(
                            assetName: controller.isCountryOfResidence.value
                                ? IconConstants.icCountryActive
                                : IconConstants.icCountryInActive,
                          ),
                          hintText:
                              StringConstants.pleaseEnterCountryOfResidence,
                        ),
                        SizedBox(height: 14.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          readOnly: true,
                          onTap: () => controller.clickOnDob(),
                          focusNode: controller.focusDateOfBirth,
                          title: StringConstants.dateOfBirth,
                          controller: controller.dateOfBirthController,
                          isCard: controller.isDateOfBirth.value,
                          prefixIcon: CommonMethods.appIcons(
                            assetName: controller.isDateOfBirth.value
                                ? IconConstants.icCalendarActive
                                : IconConstants.icCalendarInActive,
                          ),
                          hintText: StringConstants.pleaseEnterDateOfBirth,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonElevatedButton(
                          onPressed: () => controller.clickOnSubmitButton(),
                          child: Text(
                            StringConstants.submit,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: 30.px),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
