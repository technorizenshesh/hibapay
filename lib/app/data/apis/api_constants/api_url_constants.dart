class ApiUrlConstants {
  static const String baseUrlMain = 'https://hibapay.co';
  static const String baseUrl = '$baseUrlMain/api/';
  static const String baseUrlForGetMethodParams = 'hibapay.co';
  static const String endPointOfSignUp = '${baseUrl}user/sign-up';
  static const String endPointOfVerifyOtpMobile =
      '${baseUrl}user/verify-otp-mobile';
  static const String endPointOfVerifyOtp = '${baseUrl}user/verify-otp';
  static const String endPointOfCreatePassword =
      '${baseUrl}user/create-password';
  static const String endPointOfLoginMobile = '/api/user/login-mobile';
  static const String endPointOfForgotPassword =
      '${baseUrl}user/forgot-password';
  static const String endPointOfAddCard = '${baseUrl}card/add-card';
  static const String endPointOfGetCard = '${baseUrl}card/get-card';
  static const String endPointOfDelete = '${baseUrl}card/delete-card';
  static const String endPointOfGetProfile = '${baseUrl}user/get-profile';
  static const String endPointOfGetBanners = '${baseUrl}banners/get-banners';
  static const String endPointOfGetServices = '${baseUrl}hibapay/get-services';
  static const String endPointOfUFitPayGetServices =
      '${baseUrl}ufitpay/get-services';
  static const String endPointOfUFitPayGetVendors =
      '${baseUrl}ufitpay/get-vendors';
  static const String endPointOfUploadUserDocuments =
      '${baseUrl}user/upload-user-documents';

  //virtual-card
  static const String endPointOfCreateCardHolder =
      '${baseUrl}hibapay/card/create-card-holder';
  static const String endPointOfGetCardHolder =
      '${baseUrl}hibapay/card/get-card-holder';
  static const String endPointOfCreateVirtualCard =
      '${baseUrl}hibapay/card/create-virtual-card';
  static const String endPointOfListVirtualCards =
      '${baseUrl}hibapay/card/list-virtual-cards';
  static const String endPointOfDeleteVirtualCard =
      '${baseUrl}hibapay/card/delete-virtual-card';

  static const String endPointOfWithdrawVirtualCardBalance =
      '${baseUrl}hibapay/card/withdraw-virtual-card-balance';
  static const String endPointOfGetCardTransactions =
      '${baseUrl}hibapay/card/get-card-transactions';
  static const String endPointOfFundVirtualCard =
      '${baseUrl}hibapay/card/fund-virtual-card';
  static const String endPointOfChangeCardPin =
      '${baseUrl}hibapay/card/change-card-pin';
  static const String endPointOfSearchCardHolder =
      '${baseUrl}hibapay/card/search-card-holder';
}
