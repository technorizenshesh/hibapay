import 'dart:io';

import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/alert_dialog_view.dart';
import 'package:HibaPay/common/image_pick_and_crop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyIdentityController extends GetxController {
  final count = 0.obs;
  final userId = ''.obs;
  final inAsyncCall = false.obs;
  final imageGovernmentId = Rxn<File?>();
  final imageSelfiePhoto = Rxn<File?>();

  Map<String, File> imageMap = {};
  Map<String, String> bodyParams = {};

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId.value = sp.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
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

  // Function to convert an image file to PNG format
  Future<File?> convertToPNG(String imagePath) async {
    try {
      // Read the image file
      final imageBytes = await File(imagePath).readAsBytes();
      // Decode the image
      img.Image image = img.decodeImage(imageBytes)!;
      // Convert the image to PNG format
      List<int> pngBytes = img.encodePng(image);
      // Write the PNG bytes to a new file
      String pngPath = imagePath.replaceAll(path.extension(imagePath), '.png');
      File pngFile = File(pngPath);
      await pngFile.writeAsBytes(pngBytes);
      return pngFile;
    } catch (e) {
      print('Error converting image to PNG: $e');
      return null;
    }
  }

  clickOnVerifyMyIdentityButton() async {
    if (imageGovernmentId.value != null && imageSelfiePhoto.value != null) {
      inAsyncCall.value = true;
      imageMap = {
        ApiKeyConstants.uDocGovtPhoto:
            await convertToPNG(imageGovernmentId.value?.path ?? '') ?? File(''),
        ApiKeyConstants.uDocSelfyPhoto:
            await convertToPNG(imageSelfiePhoto.value?.path ?? '') ?? File(''),
      };
      bodyParams = {ApiKeyConstants.userId: userId.value};
      UserModel? userModel = await ApiMethods.uploadUserDocuments(
          imageMap: imageMap, bodyParams: bodyParams);
      if (userModel != null &&
          userModel.result != null &&
          userModel.result!.id != null &&
          userModel.result!.id!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.userId, userModel.result?.id ?? '');
        Get.toNamed(Routes.VERIFY_IDENTITY_SUCCESS);
      } else {
        Get.snackbar(
            margin: EdgeInsets.all(20.px), 'Massage', 'Image is not a valid.');
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }

  void showAlertDialog({required bool imageGovernment}) {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(),
              onPressed: () =>
                  clickCameraTextButtonView(imageGovernment: imageGovernment),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(),
              onPressed: () =>
                  clickGalleryTextButtonView(imageGovernment: imageGovernment),
            ),
          ],
          title: selectImageTextView(),
          content: contentTextView(),
        );
      },
    );
  }

  Widget selectImageTextView() => Text(
        StringConstants.selectImage,
        /* style: Theme.of(Get.context!)
            .textTheme
            .titleMedium
            ?.copyWith(fontSize: 18.px),*/
      );

  Widget contentTextView() => Text(
        StringConstants.chooseImageFromTheOptionsBelow,
        /* style: Theme.of(Get.context!)
            .textTheme
            .titleSmall
            ?.copyWith(fontSize: 14.px),*/
      );

  Widget cameraTextButtonView() => Text(
        StringConstants.camera,
        /*style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),*/
      );

  Widget galleryTextButtonView() => Text(
        StringConstants.gallery,
        /*style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),*/
      );

  Future<void> clickCameraTextButtonView(
      {required bool imageGovernment}) async {
    pickCamera(imageGovernment: imageGovernment);
    Get.back();
  }

  Future<void> clickGalleryTextButtonView(
      {required bool imageGovernment}) async {
    pickGallery(imageGovernment: imageGovernment);
    Get.back();
  }

  Future<void> pickCamera({required bool imageGovernment}) async {
    if (imageGovernment) {
      imageGovernmentId.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
      );
    } else {
      imageSelfiePhoto.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
      );
    }
    increment();
  }

  Future<void> pickGallery({required bool imageGovernment}) async {
    if (imageGovernment) {
      imageGovernmentId.value = await ImagePickerAndCropper.pickImage(
          context: Get.context!,
          wantCropper: true,
          color: Theme.of(Get.context!).primaryColor,
          pickImageFromGallery: true);
    } else {
      imageSelfiePhoto.value = await ImagePickerAndCropper.pickImage(
          context: Get.context!,
          wantCropper: true,
          color: Theme.of(Get.context!).primaryColor,
          pickImageFromGallery: true);
    }
    increment();
  }

  clickOnDeleteButton({required bool imageGovernment}) {
    if (imageGovernment) {
      imageGovernmentId.value = null;
    } else {
      imageSelfiePhoto.value = null;
    }
    increment();
  }

  clickOnGovernmentIdCard() {
    showAlertDialog(imageGovernment: true);
  }

  clickOnSelfiePhotoCard() {
    showAlertDialog(imageGovernment: false);
  }
}
