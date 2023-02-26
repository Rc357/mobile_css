import 'dart:async';

import 'package:css/constants/my_logger.dart';
import 'package:css/routes/app_pages.dart';
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
      Get.toNamed(AppPages.START);
      myLogger.i("Splash Loaded");
    });
  }
}
