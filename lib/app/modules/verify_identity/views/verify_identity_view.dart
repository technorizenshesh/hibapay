import 'dart:io';

import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/verify_identity_controller.dart';

class VerifyIdentityView extends GetView<VerifyIdentityController> {
  const VerifyIdentityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CommonWidgets.appBar(
              title: StringConstants.verifyIdentity, wantBackButton: false),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: ListView(
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
                  focusNode: controller.focusBvn,
                  title: StringConstants.bvn,
                  controller: controller.bvnController,
                  isCard: controller.isBvn.value,
                  hintText: StringConstants.pleaseEnterBvn,
                ),
                SizedBox(height: 20.px),
                GestureDetector(
                  onTap: () => controller.clickOnGovernmentIdCard(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.px),
                      gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: [
                          Theme.of(Get.context!)
                              .colorScheme
                              .secondary
                              .withOpacity(.1.px),
                          Theme.of(Get.context!)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.1.px),
                        ],
                      ),
                    ),
                    child: controller.imageGovernmentId.value != null
                        ? Stack(
                            alignment: Alignment.topRight,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 200.px,
                                child: Image.file(
                                  controller.imageGovernmentId.value ??
                                      File(''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.px),
                                child: FloatingActionButton(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  onPressed: () =>
                                      controller.clickOnDeleteButton(
                                          imageGovernment: true),
                                  child: Icon(
                                    Icons.delete_forever,
                                    color: Theme.of(context).primaryColor,
                                    size: 24.px,
                                  ),
                                ),
                              )
                            ],
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.px, vertical: 40.px),
                            child: Column(
                              children: [
                                Text(
                                  StringConstants.governmentId,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 24.px),
                                ),
                                SizedBox(height: 14.px),
                                Text(
                                  StringConstants.takeADriversLicense,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(height: 30.px),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonMethods.appIconsPng(
                                      assetName: IconConstantsPng.icAddIdentity,
                                    ),
                                    SizedBox(width: 10.px),
                                    Text(
                                      StringConstants.select,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 10.px),
                GestureDetector(
                  onTap: () => controller.clickOnSelfiePhotoCard(),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        gradient: LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          colors: [
                            Theme.of(Get.context!)
                                .colorScheme
                                .secondary
                                .withOpacity(.1.px),
                            Theme.of(Get.context!)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.1.px),
                          ],
                        )),
                    child: controller.imageSelfiePhoto.value != null
                        ? Stack(
                            alignment: Alignment.topRight,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 200.px,
                                child: Image.file(
                                  controller.imageSelfiePhoto.value ?? File(''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.px),
                                child: FloatingActionButton(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  onPressed: () =>
                                      controller.clickOnDeleteButton(
                                          imageGovernment: false),
                                  child: Icon(
                                    Icons.delete_forever,
                                    color: Theme.of(context).primaryColor,
                                    size: 24.px,
                                  ),
                                ),
                              )
                            ],
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.px, vertical: 40.px),
                            child: Column(
                              children: [
                                Text(
                                  StringConstants.selfiePhoto,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 24.px),
                                ),
                                SizedBox(height: 14.px),
                                Text(
                                  StringConstants.itsRequiredByLaw,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(height: 30.px),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonMethods.appIconsPng(
                                      assetName: IconConstantsPng.icAddIdentity,
                                    ),
                                    SizedBox(width: 10.px),
                                    Text(
                                      StringConstants.select,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 40.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnVerifyMyIdentityButton(),
                  child: Text(
                    StringConstants.verifyMyIdentity,
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
