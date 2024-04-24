import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app/data/constants/image_constants.dart';

class CommonMethods {
  static void unFocsKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static splashLogo() {
    return Image.asset(
      ImgConstants.imgSplash,
      height: 84.px,
      width: 200.px,
    );
  }

  static Widget appIcons(
      {required String assetName, double? width, double? height}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetName,
          height: height ?? 24.px,
          width: width ?? 24.px,
        ),
      ],
    );
  }

  static Widget appIconsPng(
      {required String assetName, double? width, double? height}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          assetName,
          height: height ?? 24.px,
          width: width ?? 24.px,
        ),
      ],
    );
  }

  static LinearGradient commonLinearGradientView() => LinearGradient(
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        colors: [
          Theme.of(Get.context!).colorScheme.secondary,
          Theme.of(Get.context!).colorScheme.onSecondary,
        ],
      );

  static LinearGradient commonLinearGradientViewGrey() => LinearGradient(
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        colors: [
          Theme.of(Get.context!).colorScheme.surface,
          Theme.of(Get.context!).colorScheme.surface,
        ],
      );

  static LinearGradient commonLinearGradientViewWhite() => LinearGradient(
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        colors: [
          Theme.of(Get.context!).scaffoldBackgroundColor,
          Theme.of(Get.context!).scaffoldBackgroundColor,
        ],
      );

  static Widget textViewLinearGradient(
          {String? text, bool? value, TextStyle? style}) =>
      Center(
        child: GradientWidget(
          text: text,
          style: style ??
              Theme.of(Get.context!)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
          gradient: value ?? true
              ? commonLinearGradientView()
              : commonLinearGradientViewGrey(),
        ),
      );

  static Widget iconLinearGradient(
          {required String assetName,
          double? width,
          double? height,
          bool? value}) =>
      Center(
        child: GradientWidget(
          gradient: value ?? true
              ? commonLinearGradientView()
              : commonLinearGradientViewGrey(),
          child: appIcons(assetName: assetName, width: width, height: height),
        ),
      );

  static Future<void> commonAndroidNoInternetDialog(
      {bool isDismiss = true}) async {
    await showDialog(
      context: Get.context!,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: Image.asset(ImgConstants.imgNotFound),
                ),
                const SizedBox(height: 32),
                const Text(
                  "Whoops!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "No internet connection found.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Check your connection and try again.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
      useSafeArea: true,
      barrierDismissible: isDismiss,
    );
  }

  static void noInternet() {
    Get.snackbar(
        margin: EdgeInsets.all(20.px),
        'Error',
        'Please check your internet connection');
  }

  static Widget dataNotFound() {
    return Center(
      child: Image.asset(ImgConstants.imageNoDataFound),
    );
  }
}

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
    this.text,
    required this.gradient,
    this.style,
    this.child,
  });

  final String? text;
  final TextStyle? style;
  final Widget? child;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child ?? Text(text ?? '', style: style),
    );
  }
}
