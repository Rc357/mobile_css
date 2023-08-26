import 'package:css/app/modules/qr_scanner/controller/qr_code_scanner_controller.dart';
import 'package:get/get.dart';

class QRScanLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QRScanLoginController());
  }
}
