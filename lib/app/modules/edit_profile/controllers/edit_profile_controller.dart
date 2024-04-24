import 'dart:io';

import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../../common/time_picker_view.dart';
import '../../../data/constants/string_constants.dart';

class EditProfileController extends GetxController {
  final count = 0.obs;
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParams = {};
  final inAsyncCall = false.obs;
  DateTime? dateTime;
  FocusNode focusFullName = FocusNode();
  FocusNode focusStreetAddress = FocusNode();
  FocusNode focusCity = FocusNode();
  FocusNode focusCountryOfResidence = FocusNode();
  FocusNode focusDateOfBirth = FocusNode();
  final isFullName = false.obs;
  final isStreetAddress = false.obs;
  final isCity = false.obs;
  final isCountryOfResidence = false.obs;
  final isDateOfBirth = false.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryOfResidenceController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  final countryCode = 'IN'.obs;
  final authTokenHiba = ''.obs;
  final image = Rxn<File>();

  Map<String, File> imageMap = {};

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    super.onInit();
    startListener();
    fullNameController.text = result?.firstName ?? '';
    streetAddressController.text = result?.streetAddress ?? '';
    cityController.text = result?.city ?? '';
    countryOfResidenceController.text = result?.countryCode ?? '';
    dateOfBirthController.text = result?.dob ?? '';
  }

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusStreetAddress.addListener(onFocusChange);
    focusCity.addListener(onFocusChange);
    focusCountryOfResidence.addListener(onFocusChange);
    focusDateOfBirth.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isStreetAddress.value = focusStreetAddress.hasFocus;
    isCity.value = focusCity.hasFocus;
    isCountryOfResidence.value = focusCountryOfResidence.hasFocus;
    isDateOfBirth.value = focusDateOfBirth.hasFocus;
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

  clickOnChangeProfilePicture() {
    showAlertDialog();
  }

  void showAlertDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(),
              onPressed: () => clickCameraTextButtonView(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(),
              onPressed: () => clickGalleryTextButtonView(),
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
        style: Theme.of(Get.context!)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 18.px),
      );

  Widget contentTextView() => Text(
        StringConstants.chooseImageFromTheOptionsBelow,
        style: Theme.of(Get.context!)
            .textTheme
            .displaySmall
            ?.copyWith(fontSize: 14.px),
      );

  Widget cameraTextButtonView() => Text(
        StringConstants.camera,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 14.px, color: Theme.of(Get.context!).primaryColor),
      );

  Widget galleryTextButtonView() => Text(
        StringConstants.gallery,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 14.px, color: Theme.of(Get.context!).primaryColor),
      );

  Future<void> clickCameraTextButtonView() async {
    pickCamera();
    Get.back();
  }

  Future<void> clickGalleryTextButtonView() async {
    pickGallery();
    Get.back();
  }

  Future<void> pickCamera() async {
    image.value = await ImagePickerAndCropper.pickImage(
      context: Get.context!,
      wantCropper: true,
      color: Theme.of(Get.context!).primaryColor,
    );

    increment();
  }

  Future<void> pickGallery() async {
    image.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
        pickImageFromGallery: true);
    increment();
  }

  clickOnDob() async {
    dateTime = await DatePickerView().datePickerView(
      color: Theme.of(Get.context!).primaryColor,
      lastDate: DateTime.now(),
      initialDate: DateTime(1940),
      firstDate: DateTime(1940),
    );
    if (dateTime != null) {
      dateOfBirthController.text = DateFormat('dd-MM-yyyy')
          .format(dateTime ?? DateTime.now())
          .toString();
    }
  }

  clickOnSubmitButton() async {
    if ((image.value != null ||
            (result?.image != null && result!.image!.isNotEmpty)) &&
        authTokenHiba.value.trim().isNotEmpty &&
        fullNameController.text.trim().isNotEmpty &&
        streetAddressController.text.trim().isNotEmpty &&
        cityController.text.trim().isNotEmpty &&
        countryCode.value.trim().isNotEmpty &&
        dateOfBirthController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
        ApiKeyConstants.fullName: fullNameController.text,
        ApiKeyConstants.streetAddress: streetAddressController.text,
        ApiKeyConstants.city: cityController.text,
        ApiKeyConstants.country: countryCode.value,
        ApiKeyConstants.dob: dateOfBirthController.text,
        ApiKeyConstants.countryCode: countryCode.value,
      };
      UserModel? userModel;
      if (image.value != null) {
        userModel = await ApiMethods.updateProfile(
            bodyParams: bodyParams,
            image: image.value,
            imageKey: ApiKeyConstants.image);
      } else {
        userModel = await ApiMethods.updateProfile(
          bodyParams: bodyParams,
        );
      }
      if (userModel != null && userModel.result != null) {
        result = userModel.result;
        increment();
        Get.back();
      } else {
        if (userModel != null &&
            userModel.message != null &&
            userModel.message!.isNotEmpty) {
          Get.snackbar(
              margin: EdgeInsets.all(20.px),
              'Massage',
              userModel.message.toString());
        }
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }

  clickOnCountryField() {
    return showCountryPicker(
      context: Get.context!,
      showPhoneCode: true,
      searchAutofocus: true,
      onSelect: (Country country) {
        countryOfResidenceController.text = country.name;
        countryCode.value = country.countryCode;
      },
    );
  }
}
