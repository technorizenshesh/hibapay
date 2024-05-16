import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class WebViewPaymentController extends GetxController {
  final count = 0.obs;
  // WebViewController webController = WebViewController();
  final inAsyncCall = false.obs;
  Map<String, String?> parameters = Get.parameters;
  String paymentUrl = '';

  @override
  Future<void> onInit() async {
    paymentUrl = parameters[ApiKeyConstants.paymentUrl] ?? '';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    inAsyncCall.value = true;
    /* webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) async {
            print('url:::::::::::::${url}');
            if (url.contains('https://server-php-8-2.technorizen.com/nuru/callback')) {
              Uri uri = Uri.parse(url);
              String? userId = uri.queryParameters['user_id'];
              String? bookingId = uri.queryParameters['booking_id'];
              print("userId::::::::=>$userId\nbookingId::::::::=>$bookingId");
              Map<String, dynamic> queryParameters = {
                ApiKeyConstants.userId: userId,
                "ApiKeyConstants.bookingId": bookingId
              };
              */ /* GetPayexBookingPaymentModel? getPayexBookingPaymentModel =
                  await ApiMethods.getPayexBookingPayment(
                      queryParameters: queryParameters);
              if (getPayexBookingPaymentModel != null &&
                  getPayexBookingPaymentModel.data != null) {
                if (getPayexBookingPaymentModel.data!.authCode != null &&
                    getPayexBookingPaymentModel.data!.authCode!.isNotEmpty) {
                  if (getPayexBookingPaymentModel.data!.authCode == '00') {
                    Get.offAndToNamed(Routes.CONFIRM_BOOKING);
                  } else {
                    Get.offAndToNamed(Routes.CANCEL_BOOKING);
                  }
                }
              }*/ /*
            }
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(paymentUrl)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(paymentUrl));*/
    inAsyncCall.value = false;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
