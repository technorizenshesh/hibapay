import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:hibapay/app/data/apis/api_methods/api_methods.dart';
import 'package:hibapay/app/data/apis/api_models/add_card_model.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/app/routes/app_pages.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';

class AddNewCardController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  final countryCode = ''.obs;
  final authTokenHiba = ''.obs;
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
  FocusNode focusCountryOfResidence = FocusNode();
  final isCountryOfResidence = false.obs;
  TextEditingController countryOfResidenceController = TextEditingController();

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

  Map<String, dynamic> bodyParams = {};

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
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
    focusCountryOfResidence.addListener(onFocusChange);
  }

  void onFocusChange() {
    isCardNumber.value = focusCardNumber.hasFocus;
    isMonth.value = focusMonth.hasFocus;
    isYear.value = focusYear.hasFocus;
    isCvv.value = focusCvv.hasFocus;
    isCardHoldersName.value = focusCardHoldersName.hasFocus;
    isCountryOfResidence.value = focusCountryOfResidence.hasFocus;
  }

  clickOnSaveButton() async {
    if (authTokenHiba.value.trim().isNotEmpty &&
        countryCode.value.trim().isNotEmpty &&
        cardNumber.trim().isNotEmpty &&
        expiryDate.trim().isNotEmpty &&
        cardHolderName.trim().isNotEmpty &&
        cvvCode.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.cardCountryCode: countryCode.value,
        ApiKeyConstants.cardHolder: cardHolderName,
        ApiKeyConstants.cardExpMonth: expiryDate.split('/').first,
        ApiKeyConstants.cardExpYear: expiryDate.split('/').elementAt(1),
        ApiKeyConstants.cardNumber: cardNumber.replaceAll(' ', ''),
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      };
      print(bodyParams);
      AddCardModel? addCardModel =
          await ApiMethods.addCard(bodyParams: bodyParams);
      if (addCardModel != null &&
          addCardModel.status != null &&
          addCardModel.status != '0') {
        // Get.back();
        showTheReadyDialog();
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: 'All field required');
    }
  }

  clickOnOkIAmReady() {
    Get.toNamed(Routes.VERIFY_IDENTITY);
  }

  clickOnCountryField() {
    return showCountryPicker(
      context: Get.context!,
      showPhoneCode: true,
      searchAutofocus: true,
      onSelect: (Country country) {
        countryOfResidenceController.text = country.name;
        countryCode.value = country.countryCode;
        increment();
      },
    );
  }

  void showTheReadyDialog() {
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
                  height: 240.px,
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
}
