import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/common_methods.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/edit_profile_controller.dart';
import 'dart:io';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
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
                      (controller.image.value != null)
                          ? ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.px),
                              ),
                              child: Image.file(
                                height: 100.px,
                                width: 100.px,
                                fit: BoxFit.cover,
                                File(
                                  controller.image.value!.path.toString(),
                                ),
                              ),
                            )
                          : CommonWidgets.imageView(
                              image: ImgConstants.defaultNetworkImage,
                              height: 100.px,
                              width: 100.px,
                              radius: 50.px,
                            ),
                      SizedBox(height: 20.px),
                      GestureDetector(
                        onTap: () => controller.clickOnChangeProfilePicture(),
                        child: Text(
                          StringConstants.changeProfilePicture,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 16.px),
                        ),
                      ),
                      SizedBox(height: 14.px),
                      TextField(
                        controller: controller.firstNameController,
                        decoration: CommonWidgets.inputDecoration(
                          labelText: StringConstants.firstName,
                          hintText: StringConstants.firstName,
                        ),
                      ),
                      SizedBox(height: 14.px),
                      TextField(
                        readOnly: true,
                        controller: controller.emailController,
                        decoration: CommonWidgets.inputDecoration(
                          labelText: StringConstants.email,
                          hintText: StringConstants.email,
                        ),
                      ),
                      SizedBox(height: 14.px),
                      TextField(
                        controller: controller.phoneNumberController,
                        decoration: CommonWidgets.inputDecoration(
                          labelText: StringConstants.phoneNumber,
                          hintText: StringConstants.phoneNumber,
                        ),
                      ),
                      SizedBox(height: 14.px),
                      TextField(
                        readOnly: true,
                        controller: controller.birthDateController,
                        onTap: () => controller.clickOnDob(),
                        decoration: CommonWidgets.inputDecoration(
                          labelText: StringConstants.birthDate,
                          hintText: StringConstants.birthDate,
                        ),
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
                      SizedBox(height: 10.px),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
