import 'dart:async';

import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_banners_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_services_hibapay_model.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  final authTokenHiba = ''.obs;

  @override
  void onInit() {
    Timer(
      const Duration(seconds: 3),
      () => manageSession(),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> manageSession() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    /*sp.setString(ApiKeyConstants.authTokenHiba,
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJJc3N1ZXIgb2YgdGhlIEpXVCIsImF1ZCI6IkF1ZGllbmNlIHRoYXQgdGhlIEpXVCIsInN1YiI6IlN1YmplY3Qgb2YgdGhlIEpXVCIsImlhdCI6MTcxMjM4NTA0NiwiZXhwIjoxNzQzOTIxMDQ2LCJ1c2VyIjp7ImlkIjoiMjQiLCJlbWFpbCI6InRlc3QxQGdtYWlsLmNvbSIsInVzZXJfbmFtZSI6bnVsbCwiZmlyc3RfbmFtZSI6InRlc3QiLCJsYXN0X25hbWUiOiIiLCJjb21wYW55X25hbWUiOm51bGwsIm1vYmlsZSI6IjkwOTg5Nzc0MTgiLCJnZW5kZXIiOm51bGwsImRvYiI6IjAxLTAxLTIwMDAiLCJpbWFnZSI6bnVsbCwib3RwIjo2MjU3LCJwYXNzd29yZCI6IiQyeSQxMCRXRUdhdGRIYldLRWd2STVGSWhSZm5PY2FQVllqaDRWeEpvc25tVDl6SEU4MW1Ueko1LjhxdSIsImNyZWF0ZWRfYXQiOiIyMDI0LTAzLTIxIDExOjU4OjEyIiwidXBkYXRlZF9hdCI6IjIwMjQtMDMtMjEgMTE6NTg6MTIiLCJjb3VudHJ5X2NvZGUiOiJJTiIsInJlc2lkZW5jZSI6bnVsbCwiZGV2aWNlX3Rva2VuIjpudWxsLCJkZXZpY2VfdHlwZSI6IkFORFJPSUQiLCJkZWxldGVkX2F0IjpudWxsLCJzdHJlZXRfYWRkcmVzcyI6bnVsbCwiY291bnRyeSI6bnVsbCwiY2l0eSI6bnVsbH19.TEStJ9StXRq-p5VwNCD_Xr73TNppWXilgHf-6hojVyU');
    sp.setString(ApiKeyConstants.virtualCardId, 'Text-hd63fdvisvux87sfd');*/
    if (sp.getString(ApiKeyConstants.authTokenHiba) != null &&
        sp.getString(ApiKeyConstants.authTokenHiba)!.isNotEmpty) {
      authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
      await onInitWorking();
      Get.offAllNamed(Routes.NAV_BAR);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  onInitWorking() async {
    await getBannersApi();
    await getServicesApi();
  }

  getBannersApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.type: ApiKeyConstants.home,
    };
    GetBannersModel? getBannersModel =
        await ApiMethods.getBanners(bodyParams: bodyParams);
    if (getBannersModel != null &&
        getBannersModel.result != null &&
        getBannersModel.result!.isNotEmpty) {
      getBannersResult = getBannersModel.result!;
      increment();
    }
  }

  getServicesApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    GetServicesModel? getServicesModel =
        await ApiMethods.getServices(bodyParams: bodyParams);
    if (getServicesModel != null &&
        getServicesModel.result != null &&
        getServicesModel.result!.isNotEmpty) {
      getServicesResult = getServicesModel.result!;
      increment();
    }
  }
}
