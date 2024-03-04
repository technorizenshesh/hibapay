import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(
          title: StringConstants.profile, wantBackButton: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: InkWell(
              onTap: () => controller.clickOnCard(),
              borderRadius: BorderRadius.circular(8.px),
              child: Container(
                padding: EdgeInsets.all(10.px),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.1.px),
                  borderRadius: BorderRadius.circular(10.px),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.px),
                      child: Image.asset(
                        ImgConstants.imgLogo,
                        height: 80.px,
                        width: 80.px,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.px),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tommy Jason',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 20.px,
                                  color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(height: 4.px),
                        Text(
                          'tommyjason@gmail.com',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 12.px,
                                  ),
                        ),
                        SizedBox(height: 4.px),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonMethods.appIconsPng(
                              assetName: IconConstantsPng.icCoin,
                              height: 18.px,
                              width: 18.px,
                            ),
                            SizedBox(width: 4.px),
                            Text(
                              '150',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 12.px,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    CommonMethods.appIcons(
                        assetName: IconConstants.icRightArrow)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.px),
          ListView.builder(
              // padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                    // contentPadding: EdgeInsets.zero,
                    onTap: () => controller.clickOnListTile(index: index),
                    leading: CommonMethods.appIcons(
                      assetName: controller.listOfListTileImages[index],
                      height: 40.px,
                      width: 40.px,
                    ),
                    trailing: CommonMethods.appIcons(
                        assetName: IconConstants.icRightArrow),
                    title: Text(
                      controller.listOfListTileTitles[index],
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 14.px,
                              color: Theme.of(context).primaryColor),
                    ),
                  ),
              itemCount: controller.listOfListTileTitles.length),
          SizedBox(height: 12.px),
        ],
      ),
    );
  }
}
