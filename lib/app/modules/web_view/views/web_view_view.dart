import 'package:HibaPay/app/modules/web_view/controllers/web_view_controller.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class WebViewView extends GetView<WebViewPaymentController> {
  const WebViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(),
          /* body: WebViewWidget(
            controller: controller.webController,
          ),*/
        ),
      );
    });
  }
}
