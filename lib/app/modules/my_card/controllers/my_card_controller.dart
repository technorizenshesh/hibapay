import 'package:get/get.dart';
import 'package:hibapay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:hibapay/app/data/apis/api_methods/api_methods.dart';
import 'package:hibapay/app/data/apis/api_models/get_card_model.dart';
import 'package:hibapay/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCardController extends GetxController {
  final count = 0.obs;

  Map<String, dynamic> bodyParams = {};
  final authTokenHiba = ''.obs;
  List<Result> result = [];
  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    super.onInit();
    await onInitWork();
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

  clickOnAddNewCard() {
    Get.toNamed(Routes.ADD_NEW_CARD);
  }

  onInitWork() async {
    if (authTokenHiba.value.isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {ApiKeyConstants.authTokenHiba: authTokenHiba.value};
      GetCardModel? getCardModel =
          await ApiMethods.getCard(bodyParams: bodyParams);
      if (getCardModel != null &&
          getCardModel.result != null &&
          getCardModel.result!.isNotEmpty) {
        result = getCardModel.result!;
      }
      inAsyncCall.value = false;
    }
  }

  clickOnDeleteButton({required int index}) async {
    if (result[index].cardId != null &&
        result[index].cardId!.isNotEmpty &&
        authTokenHiba.value.isNotEmpty) {
      bodyParams = {
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
        ApiKeyConstants.cardId: result[index].cardId ?? ''
      };
      GetCardModel? getCardModel =
          await ApiMethods.deleteCard(bodyParams: bodyParams);
      if (getCardModel != null &&
          getCardModel.status != null &&
          getCardModel.status!.isNotEmpty) {
        await onInitWork();
      }
    }
  }
}
