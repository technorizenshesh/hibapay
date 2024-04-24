import 'package:HibaPay/common/globle.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_profile_controller.dart';

class MyProfileView extends GetView<MyProfileController> {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CommonWidgets.appBar(
            title: StringConstants.myProfile,
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.px),
                    result != null &&
                            result?.image != null &&
                            result!.image!.isNotEmpty &&
                            result!.image !=
                                'https://hibapay.co/public/uploads/users/profile/'
                        ? CommonWidgets.imageView(
                            image: result?.image ?? '',
                            height: 100.px,
                            width: 100.px,
                            borderRadius: BorderRadius.circular(50.px),
                          )
                        : CommonWidgets.imageView(
                            image: ImgConstants.defaultNetworkImage,
                            height: 100.px,
                            width: 100.px,
                            borderRadius: BorderRadius.circular(50.px),
                          ),
                    SizedBox(height: 20.px),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        StringConstants.personalInfo,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16.px,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.color),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () => controller
                                  .clickOnListTilePersonalInfo(index: index),
                              trailing: Text(
                                methodPersonalInfo(index: index),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                              title: Text(
                                controller
                                    .listOfListTilePersonalInfoTitles[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                        itemCount:
                            controller.listOfListTilePersonalInfoTitles.length),
                    SizedBox(height: 20.px),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        StringConstants.contactInfo,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16.px,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.color),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () => controller
                                  .clickOnListTilePersonalInfo(index: index),
                              trailing: Text(
                                methodContactInfo(index: index),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                              title: Text(
                                controller
                                    .listOfListTileContactInfoTitles[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                        itemCount:
                            controller.listOfListTileContactInfoTitles.length),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnEditProfileButton(),
                      child: Text(
                        StringConstants.editProfile,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnDeleteAccountButton(),
                      child: Text(
                        StringConstants.deleteAccount,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  String methodPersonalInfo({required int index}) {
    switch (index) {
      case 0:
        return result?.firstName ?? 'Not input';
      /*
      case 1:
        return result?.lastName ?? 'Not input';*/
      case 1:
        return result?.dob ?? 'Not input';
      case 2:
        return result?.streetAddress ?? 'Not input';
      case 3:
        return result?.city ?? 'Not input';
      case 4:
        return result?.countryCode ?? 'Not input';
    }
    return '';
  }

  String methodContactInfo({required int index}) {
    switch (index) {
      case 0:
        return result?.mobile ?? 'Not input';
      case 1:
        return result?.email ?? 'Not input';
    }
    return '';
  }
}
