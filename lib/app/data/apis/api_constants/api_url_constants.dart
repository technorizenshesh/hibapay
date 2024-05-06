class ApiUrlConstants {
  static const String baseUrlMain = 'https://hibapay.co';
  static const String baseUrl = '$baseUrlMain/api/';
  static const String baseUrlForGetMethodParams = 'hibapay.co';
  static const String endPointOfSignUp = '${baseUrl}user/sign-up';
  static const String endPointOfSignUpOtpRequest =
      '${baseUrl}user/sign-up-otp-request';
  static const String endPointOfSignUpOtpRequestVerify =
      '${baseUrl}user/sign-up-otp-request-verify';
  static const String endPointOfUpdateProfile = '${baseUrl}user/update-profile';
  static const String endPointOfDeleteProfile = '${baseUrl}user/delete-profile';
  static const String endPointOfUpdateAppPin = '${baseUrl}user/update-app-pin';
  static const String endPointOfVerifyOtpMobile =
      '${baseUrl}user/verify-otp-mobile';
  static const String endPointOfVerifyOtp = '${baseUrl}user/verify-otp';
  static const String endPointOfCreatePassword =
      '${baseUrl}user/create-password';
  static const String endPointOfChangePassword =
      '${baseUrl}user/change-password';
  static const String endPointOfLoginMobile = '/api/user/login-mobile';
  static const String endPointOfUFitPayWalletRecharge =
      '/api/ufitpay/wallet-recharge';
  static const String endPointOfContactUsQuestions =
      '${baseUrl}contact-us-questions';
  static const String endPointOfLogin = '/api/user/login';
  static const String endPointOfFaqs = '${baseUrl}faqs';
  static const String endPointOfAbout = '${baseUrl}about';
  static const String endPointOfTermConditions = '${baseUrl}term-conditions';
  static const String endPointOfForgotPassword =
      '${baseUrl}user/forgot-password';
  static const String endPointOfAddCard = '${baseUrl}card/add-card';
  static const String endPointOfGetCard = '${baseUrl}card/get-card';
  static const String endPointOfDelete = '${baseUrl}card/delete-card';
  static const String endPointOfGetProfile = '${baseUrl}user/get-profile';
  static const String endPointOfGetBanners = '${baseUrl}banners/get-banners';
  static const String endPointOfGetServices = '${baseUrl}hibapay/get-services';
  static const String endPointOfGetPriceList =
      '${baseUrl}ufitpay/get-price-list';
  static const String endPointOfGetPrice = '${baseUrl}ufitpay/get-price';
  static const String endPointOfContactUs = '${baseUrl}contact-us';
  static const String endPointOfGetWalletTransaction =
      '${baseUrl}ufitpay/get-wallet-transaction';
  static const String endPointOfUFitPayGetServices =
      '${baseUrl}ufitpay/get-services';
  static const String endPointOfUFitPayGetVendors =
      '${baseUrl}ufitpay/get-vendors';
  static const String endPointOfUFitPayGetPriceList =
      '${baseUrl}ufitpay/get-price-list';
  static const String endPointOfUFitPayBillPay = '${baseUrl}ufitpay/bill-pay';
  static const String endPointOfSendGift = '${baseUrl}gift/send-gift';
  static const String endPointOfGetReceivedGifts =
      '${baseUrl}gift/get-received-gifts';
  static const String endPointOfSendGiftAsMoneyClaim =
      '${baseUrl}gift/send-gift-as-money-claim';
  static const String endPointOfUFitPayGetPackages =
      '${baseUrl}ufitpay/get-packages';
  static const String endPointOfGetLiveTransactionDetails =
      '${baseUrl}ufitpay/get-live-transaction-details';
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
  static const String endPointOfGetVirtualCard =
      '${baseUrl}hibapay/card/get-virtual-card';
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
