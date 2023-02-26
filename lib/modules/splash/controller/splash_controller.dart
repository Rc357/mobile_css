import 'dart:async';

import 'package:css/routes/app_pages.dart';
import 'package:get/get.dart';

class StartController extends GetxController {
  static StartController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    _loadingTimer();
  }

  void _loadingTimer() async {
    Timer(const Duration(seconds: 10), () {
      Get.toNamed(AppPages.START);
    });
  }
}
