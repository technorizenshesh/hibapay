import 'dart:convert';
import 'dart:io';

import 'package:HibaPay/app/data/apis/api_constants/api_url_constants.dart';
import 'package:HibaPay/app/data/apis/api_models/add_card_model.dart';
import 'package:HibaPay/app/data/apis/api_models/bill_pay_model.dart';
import 'package:HibaPay/app/data/apis/api_models/create_card_holder_model.dart';
import 'package:HibaPay/app/data/apis/api_models/create_virtual_card_model.dart';
import 'package:HibaPay/app/data/apis/api_models/delete_virtual_card_model.dart';
import 'package:HibaPay/app/data/apis/api_models/fund_virtual_card_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_banners_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_holder_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_transactions_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_packages_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_price_list_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_services_hibapay_model.dart';
import 'package:HibaPay/app/data/apis/api_models/list_virtual_cards_model.dart';
import 'package:HibaPay/app/data/apis/api_models/search_card_holder_model.dart';
import 'package:HibaPay/app/data/apis/api_models/u_fit_pay_get_services_model.dart';
import 'package:HibaPay/app/data/apis/api_models/ufitpay_get_vendors_model.dart';
import 'package:HibaPay/common/http_methods.dart';
import 'package:http/http.dart' as http;

import '../api_models/user_model.dart';

class ApiMethods {
  static Future<UserModel?> signUp({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSignUp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> uploadUserDocuments({
    void Function(int)? checkResponse,
    Map<String, File>? imageMap,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.multipart(
      multipartRequestType: 'POST',
      imageMap: imageMap,
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUploadUserDocuments,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<AddCardModel?> addCard({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddCardModel? addCardModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddCard,
      checkResponse: checkResponse,
    );
    if (response != null) {
      addCardModel = AddCardModel.fromJson(jsonDecode(response.body));
      return addCardModel;
    }
    return null;
  }

  static Future<GetCardModel?> deleteCard({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetCardModel? getCardModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfDelete,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCardModel = GetCardModel.fromJson(jsonDecode(response.body));
      return getCardModel;
    }
    return null;
  }

  static Future<GetCardModel?> getCard({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetCardModel? getCardModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetCard,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCardModel = GetCardModel.fromJson(jsonDecode(response.body));
      return getCardModel;
    }
    return null;
  }

  static Future<UserModel?> verifyOtpMobile({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfVerifyOtpMobile,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> verifyOtpEmail({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfVerifyOtp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> forgotPassword({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfForgotPassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> createPassword({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCreatePassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> loginMobile({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfLoginMobile,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> getMethodForUserModel({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    required String url,
  }) async {
    UserModel userModel;
    http.Response? response = await MyHttp.getMethod(
      url: url,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> getMethodParamsForUserModel({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
    required String urlForGetMethod,
  }) async {
    UserModel userModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: urlForGetMethod,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<GetServicesModel?> getServices({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetServicesModel? getServicesModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetServices,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getServicesModel = GetServicesModel.fromJson(jsonDecode(response.body));
      return getServicesModel;
    }
    return null;
  }

  static Future<UFitPayGetServicesModel?> uFitPayGetServices({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UFitPayGetServicesModel? uFitPayGetServicesModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUFitPayGetServices,
      checkResponse: checkResponse,
    );
    if (response != null) {
      uFitPayGetServicesModel =
          UFitPayGetServicesModel.fromJson(jsonDecode(response.body));
      return uFitPayGetServicesModel;
    }
    return null;
  }

  static Future<GetPackagesModel?> uFitPayGetPackages({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetPackagesModel? getPackagesModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUFitPayGetPackages,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPackagesModel = GetPackagesModel.fromJson(jsonDecode(response.body));
      return getPackagesModel;
    }
    return null;
  }

  static Future<UFitPayGetVendorsModel?> uFitPayGetVendors({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UFitPayGetVendorsModel? uFitPayGetVendorsModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUFitPayGetVendors,
      checkResponse: checkResponse,
    );
    if (response != null) {
      uFitPayGetVendorsModel =
          UFitPayGetVendorsModel.fromJson(jsonDecode(response.body));
      return uFitPayGetVendorsModel;
    }
    return null;
  }

  static Future<GetPriceListModel?> uFitPayGetPriceList({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetPriceListModel? getPriceListModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUFitPayGetPriceList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPriceListModel = GetPriceListModel.fromJson(jsonDecode(response.body));
      return getPriceListModel;
    }
    return null;
  }

  static Future<BillPayModel?> uFitPayBillPay({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    BillPayModel? billPayModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUFitPayBillPay,
      checkResponse: checkResponse,
    );
    if (response != null) {
      billPayModel = BillPayModel.fromJson(jsonDecode(response.body));
      return billPayModel;
    }
    return null;
  }

  static Future<UserModel?> getProfile({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetProfile,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<GetBannersModel?> getBanners({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetBannersModel? getBannersModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetBanners,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getBannersModel = GetBannersModel.fromJson(jsonDecode(response.body));
      return getBannersModel;
    }
    return null;
  }

  static Future<CreateCardHolderModel?> createCardHolder({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    CreateCardHolderModel? createCardHolderModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCreateCardHolder,
      checkResponse: checkResponse,
    );
    if (response != null) {
      createCardHolderModel =
          CreateCardHolderModel.fromJson(jsonDecode(response.body));
      return createCardHolderModel;
    }
    return null;
  }

  static Future<GetCardHolderModel?> getCardHolder({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetCardHolderModel? getBannersModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetCardHolder,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getBannersModel = GetCardHolderModel.fromJson(jsonDecode(response.body));
      return getBannersModel;
    }
    return null;
  }

  static Future<ListVirtualCardsModel?> listVirtualCards({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    ListVirtualCardsModel? listVirtualCardsModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfListVirtualCards,
      checkResponse: checkResponse,
    );
    if (response != null) {
      listVirtualCardsModel =
          ListVirtualCardsModel.fromJson(jsonDecode(response.body));
      return listVirtualCardsModel;
    }
    return null;
  }

  static Future<CreateVirtualCardModel?> createVirtualCard({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    CreateVirtualCardModel? createVirtualCardModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCreateVirtualCard,
      checkResponse: checkResponse,
    );
    if (response != null) {
      createVirtualCardModel =
          CreateVirtualCardModel.fromJson(jsonDecode(response.body));
      return createVirtualCardModel;
    }
    return null;
  }

  static Future<DeleteVirtualCardModel?> deleteVirtualCard({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    DeleteVirtualCardModel? createVirtualCardModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfDeleteVirtualCard,
      checkResponse: checkResponse,
    );
    if (response != null) {
      createVirtualCardModel =
          DeleteVirtualCardModel.fromJson(jsonDecode(response.body));
      return createVirtualCardModel;
    }
    return null;
  }

  static Future<GetCardTransactionsModel?> getCardTransactions({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetCardTransactionsModel? getCardTransactionsModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetCardTransactions,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCardTransactionsModel =
          GetCardTransactionsModel.fromJson(jsonDecode(response.body));
      return getCardTransactionsModel;
    }
    return null;
  }

  static Future<FundVirtualCardModel?> withdrawVirtualCardBalance({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    FundVirtualCardModel? fundVirtualCardModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfWithdrawVirtualCardBalance,
      checkResponse: checkResponse,
    );
    if (response != null) {
      fundVirtualCardModel =
          FundVirtualCardModel.fromJson(jsonDecode(response.body));
      return fundVirtualCardModel;
    }
    return null;
  }

  static Future<FundVirtualCardModel?> fundVirtualCard({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    FundVirtualCardModel? fundVirtualCardModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfFundVirtualCard,
      checkResponse: checkResponse,
    );
    if (response != null) {
      fundVirtualCardModel =
          FundVirtualCardModel.fromJson(jsonDecode(response.body));
      return fundVirtualCardModel;
    }
    return null;
  }

  static Future<FundVirtualCardModel?> changeCardPin({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    FundVirtualCardModel? fundVirtualCardModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfChangeCardPin,
      checkResponse: checkResponse,
    );
    if (response != null) {
      fundVirtualCardModel =
          FundVirtualCardModel.fromJson(jsonDecode(response.body));
      return fundVirtualCardModel;
    }
    return null;
  }

  static Future<SearchCardHolderModel?> searchCardHolder({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SearchCardHolderModel? fundVirtualCardModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSearchCardHolder,
      checkResponse: checkResponse,
    );
    if (response != null) {
      fundVirtualCardModel =
          SearchCardHolderModel.fromJson(jsonDecode(response.body));
      return fundVirtualCardModel;
    }
    return null;
  }
}
