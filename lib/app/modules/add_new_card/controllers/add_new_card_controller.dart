import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class AddNewCardController extends GetxController {
  final count = 0.obs;

  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode focusCardNumber = FocusNode();
  FocusNode focusMonth = FocusNode();
  FocusNode focusYear = FocusNode();
  FocusNode focusCvv = FocusNode();
  FocusNode focusCardHoldersName = FocusNode();

  final isCardNumber = false.obs;
  final isMonth = false.obs;
  final isYear = false.obs;
  final isCvv = false.obs;
  final isCardHoldersName = false.obs;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHoldersNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    startListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void startListener() {
    focusCardNumber.addListener(onFocusChange);
    focusMonth.addListener(onFocusChange);
    focusYear.addListener(onFocusChange);
    focusCvv.addListener(onFocusChange);
    focusCardHoldersName.addListener(onFocusChange);
  }

  void onFocusChange() {
    isCardNumber.value = focusCardNumber.hasFocus;
    isMonth.value = focusMonth.hasFocus;
    isYear.value = focusYear.hasFocus;
    isCvv.value = focusCvv.hasFocus;
    isCardHoldersName.value = focusCardHoldersName.hasFocus;
  }

  clickOnSaveButton() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 210.px,
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/img_pattern.png'),
                    ],
                  ),
                ),
                Container(
                  height: 210.px,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.px)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.px),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(height: 40.px),
                      Text(
                        StringConstants.contactInfo,
                        maxLines: 1,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 20.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                      SizedBox(height: 14.px),
                      Text(
                        StringConstants.nowYouCanShop,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 12.px,
                                ),
                      ),
                      SizedBox(height: 16.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => clickOnOkIAmReady(),
                        child: Text(
                          StringConstants.okIAmReady,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            CommonMethods.appIcons(
              assetName: IconConstants.icCard,
              height: 88.px,
              width: 88.px,
            ),
          ],
        );
      },
    );
  }

  clickOnOkIAmReady() {
    Get.toNamed(Routes.VERIFY_IDENTITY);
  }
}
