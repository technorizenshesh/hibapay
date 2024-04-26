import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_received_gifts_model.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GiftUserCardsController extends GetxController {
  final count = 0.obs;
  List list = [
    {'isOpen': 'yes'},
    {'isOpen': 'no'},
  ];

  Map<String, dynamic> bodyParams = {};
  final authTokenHiba = ''.obs;
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

  clickOnCard({required int index}) async {
    inAsyncCall.value = true;
    await sendGiftAsMoneyClaimApi(
        giftId: getReceivedGiftsResult[index].giftsId ?? '');
    await getReceivedGiftsApi();
    inAsyncCall.value = false;
  }

  onInitWork() async {
    if (authTokenHiba.value.isNotEmpty) {
      inAsyncCall.value = true;
      await getReceivedGiftsApi();
      inAsyncCall.value = false;
    }
  }

  getReceivedGiftsApi() async {
    bodyParams.clear();
    bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    GetReceivedGiftsModel? getReceivedGiftsModel =
        await ApiMethods.getReceivedGifts(bodyParams: bodyParams);
    if (getReceivedGiftsModel != null && getReceivedGiftsModel.result != null) {
      getReceivedGiftsResult = getReceivedGiftsModel.result!;
      increment();
    }
  }

  sendGiftAsMoneyClaimApi({required String giftId}) async {
    bodyParams.clear();
    bodyParams = {
      ApiKeyConstants.giftId: giftId,
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    GetReceivedGiftsModel? getReceivedGiftsModel =
        await ApiMethods.sendGiftAsMoneyClaim(bodyParams: bodyParams);
    if (getReceivedGiftsModel != null && getReceivedGiftsModel.result != null) {
      getReceivedGiftsResult = getReceivedGiftsModel.result!;
      increment();
    }
  }
}
