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
}
