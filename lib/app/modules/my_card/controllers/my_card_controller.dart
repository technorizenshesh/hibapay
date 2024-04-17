import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/delete_virtual_card_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_holder_model.dart';
import 'package:HibaPay/app/data/apis/api_models/list_virtual_cards_model.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<ListVirtualCardsResult> listVirtualCardsResult = [];

class MyCardController extends GetxController {
  final count = 0.obs;

  Map<String, dynamic> bodyParams = {};
  final authTokenHiba = ''.obs;
  final inAsyncCall = false.obs;

  GetCardHolderResult? getCardHolderResult;

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

  onInitWork() async {
    if (authTokenHiba.value.isNotEmpty) {
      inAsyncCall.value = true;
      await getCardHolderApi();
      await listVirtualCardsApi();
      inAsyncCall.value = false;
    }
  }

  clickOnDeleteButton({required int index}) async {
    CommonWidgets.showAlertDialog(
      title: 'Delete Info',
      content: 'Delete your virtual card',
      onPressedYes: () async {
        Get.back();
        if (listVirtualCardsResult[index].vcardCardId != null &&
            listVirtualCardsResult[index].vcardCardId!.isNotEmpty &&
            authTokenHiba.value.isNotEmpty) {
          inAsyncCall.value = true;
          bodyParams = {
            ApiKeyConstants.authTokenHiba: authTokenHiba.value,
            ApiKeyConstants.virtualCardId:
                listVirtualCardsResult[index].vcardCardId ?? ''
          };
          DeleteVirtualCardModel? deleteVirtualCardModel =
              await ApiMethods.deleteVirtualCard(bodyParams: bodyParams);
          if (deleteVirtualCardModel != null &&
              deleteVirtualCardModel.result != null) {
            await onInitWork();
          }
        }
      },
    );
  }

  getCardHolderApi() async {
    bodyParams.clear();
    bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    GetCardHolderModel? getCardHolderModel =
        await ApiMethods.getCardHolder(bodyParams: bodyParams);
    if (getCardHolderModel != null && getCardHolderModel.result != null) {
      getCardHolderResult = getCardHolderModel.result;
      if (getCardHolderResult != null &&
          getCardHolderResult!.cchCardHolderId != null &&
          getCardHolderResult!.cchCardHolderId!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.cardHolderId,
            getCardHolderResult!.cchCardHolderId!);
      }
      increment();
    }
  }

  listVirtualCardsApi() async {
    bodyParams.clear();
    bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    ListVirtualCardsModel? listVirtualCardsModel =
        await ApiMethods.listVirtualCards(bodyParams: bodyParams);
    listVirtualCardsResult.clear();
    if (listVirtualCardsModel != null &&
        listVirtualCardsModel.result != null &&
        listVirtualCardsModel.result!.isNotEmpty) {
      listVirtualCardsResult = listVirtualCardsModel.result!;
      increment();
    }
  }

  clickOnCreateVirtualCard() async {
    await Get.toNamed(Routes.CREATE_VIRTUAL_CARD);
    await onInitWork();
  }

  clickOnCreateVirtualCardHolder() async {
    await Get.toNamed(Routes.CREATE_CARD_HOLDER);
    await onInitWork();
  }
}
