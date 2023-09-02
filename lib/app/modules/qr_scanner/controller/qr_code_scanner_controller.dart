import 'package:css/app/enum/offices_key_enum.dart';
import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

enum QRScanLoginControllerStatus { initial, loading, loaded, error }

class QRScanLoginController extends GetxController {
  static QRScanLoginController get instance => Get.find();
  late Worker _statusEverWorker;
  final _status = QRScanLoginControllerStatus.initial.obs;
  bool get isLoading => _status.value == QRScanLoginControllerStatus.loading;

  // final userData = Rxn<UserModel>();

  String currentState() => 'QRScanLoginController(_status: ${_status.value},)';

  @override
  void onInit() {
    _monitorFeedbackFormStatus();
    super.onInit();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorFeedbackFormStatus() {
    _statusEverWorker = ever(
      _status,
      (value) async {
        switch (value) {
          case QRScanLoginControllerStatus.error:
            MyLogger.printError(currentState());
            break;
          case QRScanLoginControllerStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case QRScanLoginControllerStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case QRScanLoginControllerStatus.loaded:
            MyLogger.printInfo(currentState());
            break;
        }
      },
    );
  }

  void loginViaQR(Barcode? result) async {
    if (result != null) {
      try {
        _status.value = QRScanLoginControllerStatus.loading;
        MyLogger.printInfo("QR CODE: ${result.code}");

        Get.back(closeOverlays: true);

        if (result.code! == OfficeQRData.library.description) {
          Get.toNamed(AppPages.CREATE_USER_LIBRARY);
        } else if (result.code! == OfficeQRData.adminsOffice.description) {
          Get.toNamed(AppPages.CREATE_USER_ADMIN_OFFICE);
        } else if (result.code! == OfficeQRData.cashier.description) {
          Get.toNamed(AppPages.CREATE_USER_CASHIER);
        } else if (result.code! == OfficeQRData.registrar.description) {
          Get.toNamed(AppPages.CREATE_USER_REGISTRAR);
        } else if (result.code! == OfficeQRData.securityOffice.description) {
          Get.toNamed(AppPages.CREATE_USER_SECURITY_OFFICE);
        }

        _status.value = QRScanLoginControllerStatus.loaded;
      } catch (e) {
        _status.value = QRScanLoginControllerStatus.error;
        Get.snackbar(
          'Warning!',
          "Invalid QR Code or Already Used.",
          colorText: Colors.white,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.add_alert),
        );
      }
    }
  }
}
