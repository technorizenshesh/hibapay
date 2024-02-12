import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           ClipRRect(
            borderRadius: BorderRadius.circular(50.px),
            child: Image.asset(
              ImgConstants.imgLogo,
              height: 100.px,
              width: 100.px,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.px),
          Text(
            'Tommy Jason',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 20.px, color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: 4.px),
          Text(
            'tommyjason@gmail.com',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 12.px,
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
