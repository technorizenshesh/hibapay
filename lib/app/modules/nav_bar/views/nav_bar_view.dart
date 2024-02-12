import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nav_bar_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: controller.body(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.px, vertical: 8.px),
                      child: GNav(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.px, vertical: 4.px),
                        tabs: [
                          button(
                              image: IconConstants.icHomeInActive,
                              text: StringConstants.home,
                              index: 0),
                          button(
                              image: IconConstants.icCardInActive,
                              text: StringConstants.myCard,
                              index: 1),
                          button(
                              image: IconConstants.icCardInActive,
                              text: '',
                              index: 2),
                          button(
                              image: IconConstants.icAccountInActive,
                              text: StringConstants.account,
                              index: 3),
                          button(
                              image: IconConstants.icProfileInActive,
                              text: StringConstants.profile,
                              index: 4),
                        ],
                        selectedIndex: selectedIndex.value,
                        onTabChange: (index) {
                          selectedIndex.value = index;
                          controller.increment();
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedIndex.value = 2;
                      controller.increment();
                    },
                    child: CommonMethods.appIcons(
                      width: 84.px,
                      height: 84.px,
                      assetName: IconConstants.icScan,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  button({required String image, required String text, required int index}) {
    return GButton(
      icon: Icons.add,
      leading: Column(
        children: [
          CommonMethods.iconLinearGradient(
            assetName: image,
            value: selectedIndex.value == index,
          ),
          CommonMethods.textViewLinearGradient(
            text: text,
            style: Theme.of(Get.context!)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 12.px),
            value: selectedIndex.value == index,
          ),
        ],
      ),
    );
  }
}
