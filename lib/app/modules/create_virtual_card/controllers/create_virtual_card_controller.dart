import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/create_virtual_card_model.dart';
import 'package:HibaPay/app/data/apis/api_models/list_virtual_cards_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateVirtualCardController extends GetxController {
  final count = 0.obs;

  final isName = false.obs;
  final isColor = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  FocusNode focusName = FocusNode();
  FocusNode focusColor = FocusNode();
  Map<String, dynamic> bodyParams = {};
  final authTokenHiba = ''.obs;
  final cardHolderId = ''.obs;

  final inAsyncCall = false.obs;

  Color currentColor = Colors.black;
  String selectedColor = '#00000';
  ListVirtualCardsModel? listVirtualCardsModel;

  void changeColor(Color color) {
    currentColor = color;
    selectedColor = '#${color.value.toRadixString(16).substring(2)}';
    colorController.text = ColorNames.guess(color);
    increment();
  }

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    cardHolderId.value = sp.getString(ApiKeyConstants.cardHolderId) ?? '';
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
    focusName.addListener(onFocusChange);
    focusColor.addListener(onFocusChange);
  }

  void onFocusChange() {
    isName.value = focusName.hasFocus;
    isColor.value = focusColor.hasFocus;
  }

  clickOnCreateButton() async {
    if (nameController.text.trim().isNotEmpty &&
        colorController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.cardBrand: 'mastercard',
        ApiKeyConstants.cardCurrency: 'NGN',
        ApiKeyConstants.amount: '2000',
        ApiKeyConstants.fundingCurrency: 'NGN',
        ApiKeyConstants.cardHolderId: cardHolderId.value,
        ApiKeyConstants.callbackUrl: '',
        ApiKeyConstants.color: selectedColor,
        ApiKeyConstants.name: nameController.text,
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      };
      CreateVirtualCardModel? createVirtualCardModel =
          await ApiMethods.createVirtualCard(bodyParams: bodyParams);
      if (createVirtualCardModel != null &&
          createVirtualCardModel.result != null) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.virtualCardId,
            createVirtualCardModel.result?.data?.id ?? '');
        await listVirtualCardsApi();
        Get.back();
      } else {
        CommonWidgets.snackBarView(title: 'This time only one card add');
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }

  listVirtualCardsApi() async {
    bodyParams.clear();
    bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    listVirtualCardsModel =
        await ApiMethods.listVirtualCards(bodyParams: bodyParams);
    listVirtualCardsResult.clear();
    if (listVirtualCardsModel != null &&
        listVirtualCardsModel!.result != null &&
        listVirtualCardsModel!.result!.isNotEmpty) {
      listVirtualCardsResult = listVirtualCardsModel!.result!;
      if (listVirtualCardsResult.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.virtualCardId,
            listVirtualCardsResult.first.vcardCardId ?? '');
      }
      increment();
    }
  }

  clickOnPickColorField() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            StringConstants.pickColor,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: changeColor,
              colorPickerWidth: 300.0,
              pickerAreaHeightPercent: 0.7,
              enableAlpha: true,
              displayThumbColor: true,
              showLabel: true,
              paletteType: PaletteType.hsv,
              pickerAreaBorderRadius: BorderRadius.circular(12.0),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                StringConstants.ok,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
