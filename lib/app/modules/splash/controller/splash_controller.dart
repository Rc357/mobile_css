import 'dart:async';

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
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(AppPages.OFFICE_DASHBOARD);
      myLogger.i("Splash Loaded");
    });
  }
}
