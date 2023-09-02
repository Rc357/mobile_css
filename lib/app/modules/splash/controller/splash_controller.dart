import 'dart:async';

import 'package:css/app/constants/constants.dart';
import 'package:css/app/constants/my_logger.dart';
import 'package:css/app/routes/app_pages.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    _loadingTimer();
  }

  void _loadingTimer() {
    Timer(const Duration(seconds: 3), () {
      // if (ConstantApp.userType == 'user') {
      // Get.toNamed(AppPages.START);
      // } else {
      //   Get.toNamed(AppPages.OFFICE_DASHBOARD);
      // }
      Get.toNamed(AppPages.OFFICE_DASHBOARD);
      myLogger.i("Splash Loaded");
    });
  }
}
