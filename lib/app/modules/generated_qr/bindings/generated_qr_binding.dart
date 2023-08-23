import 'package:get/get.dart';

import '../controllers/generated_qr_controller.dart';

class GeneratedQrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeneratedQrController>(
      () => GeneratedQrController(),
    );
  }
}
