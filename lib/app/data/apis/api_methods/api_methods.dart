import 'dart:convert';
import 'dart:io';

import 'package:hibapay/app/data/apis/api_constants/api_url_constants.dart';
import 'package:hibapay/app/data/apis/api_models/add_card_model.dart';
import 'package:hibapay/app/data/apis/api_models/get_banners_model.dart';
import 'package:hibapay/app/data/apis/api_models/get_card_model.dart';
import 'package:hibapay/app/data/apis/api_models/get_services_hibapay_model.dart';
import 'package:hibapay/app/data/apis/api_models/u_fit_pay_get_services_model.dart';
import 'package:hibapay/common/http_methods.dart';
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
}
