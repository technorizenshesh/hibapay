///flutter pub add connectivity_plus => For Check Internet on real time
import 'dart:async';

import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AC extends GetxController {
  static final isConnect = false.obs;
  int isDialogShow = 0;
  final Connectivity connectivity = Connectivity();

  Future<void> getNetworkConnectionType() async {
    try {
      List<ConnectivityResult> connectivityResult;
      connectivityResult = await connectivity.checkConnectivity();
      return updateConnectionState(connectivityResult.first);
    } on PlatformException catch (e) {
      Get.snackbar(
          margin: EdgeInsets.all(20.px),
          'check your internet connection',
          e.toString());
    }
  }

/*  StreamSubscription checkNetworkConnection() {
    final networkConnection = false.obs;
    return connectivity.onConnectivityChanged.listen((event) async {
      networkConnection.value =
          await CommonWidgets.internetConnectionCheckerMethod();
      if (networkConnection.value) {
        isConnect.value = true;
        if (isDialogShow == 1) {
          Get.back();
        }
      } else {
        isConnect.value = false;
        isDialogShow = 1;
        CommonMethods.commonAndroidNoInternetDialog();
        //CommonMethods.noInternet();
      }
      return updateConnectionState(event);
    });
  }*/

  StreamSubscription checkNetworkConnection() {
    return connectivity.onConnectivityChanged.listen((event) {
      CommonWidgets.internetConnectionCheckerMethod().then((connected) {
        if (connected) {
          isConnect.value = true;
          if (isDialogShow == 1) {
            Get.back();
          }
        } else {
          isConnect.value = false;
          isDialogShow = 1;
          CommonMethods.commonAndroidNoInternetDialog();
        }
      }).catchError((error) {
        // Handle errors from internetConnectionCheckerMethod if any
        print('Error: $error');
      });

      updateConnectionState(event.first);
    });
  }

  void updateConnectionState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        isConnect.value = true;
        break;
      case ConnectivityResult.none:
        isConnect.value = false;
        break;
      default:
        break;
    }
  }

/*
  void updateConnectionState(List<ConnectivityResult> result) {
    switch (result) {
      case ConnectivityResult.wifi:
        update();
        break;
      case ConnectivityResult.mobile:
        update();
        break;
      case ConnectivityResult.none:
        update();
        break;
      default:
        //Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }
*/
}
