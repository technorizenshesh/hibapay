/*
<activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>

    Add UCropActivity into your AndroidManifest.xml
 */

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerAndCropper {
  String string = "";
  static List<File> convertXFilesToFiles({required List<XFile> xFiles}) {
    List<File> files = xFiles.map((xFile) => File(xFile.path)).toList();
    return files;
  }

  static Future<File?> pickImage({
    bool pickImageFromGallery = false,
    bool wantCropper = false,
    required BuildContext context,
    Color color = Colors.blue,
  }) async {
    XFile? imagePicker;
    try {
      imagePicker = pickImageFromGallery
          ? await ImagePicker().pickImage(source: ImageSource.gallery)
          : await ImagePicker().pickImage(source: ImageSource.camera);
    } catch (e) {
      //handle error
      print('e:::::::::::::${e}');
    }
    if (imagePicker != null) {
      if (wantCropper) {
        CroppedFile? cropImage = await ImageCropper().cropImage(
          sourcePath: imagePicker.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          uiSettings: [
            AndroidUiSettings(
              toolbarColor: color,
              toolbarTitle: "Cropper",
              activeControlsWidgetColor: color,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
            ),
          ],
          compressQuality: 40,
        );
        if (cropImage != null) {
          return File(cropImage.path);
        } else {
          // return File(imagePicker.path);
          return null;
        }
      } else {
        return File(imagePicker.path);
        //return null;
      }
    } else {
      return null;
    }
  }

  static Future<List<XFile>> pickMultipleImages() async {
    final ImagePicker imagePicker = ImagePicker();
    List<XFile> imageFileList = [];

    final List<XFile> selectedImages = await imagePicker.pickMultiImage() ?? [];
    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
      if (kDebugMode) {
        print("Selected Image List Length:${imageFileList.length}");
      }
      return imageFileList;
    } else {
      return [];
    }
  }
}
