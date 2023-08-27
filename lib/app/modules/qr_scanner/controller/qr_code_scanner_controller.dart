import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/user_model.dart';
import 'package:css/app/repositories/user_repository.dart';
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

  final userData = Rxn<UserModel>();

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
        MyLogger.printInfo("GET QR CODE: ${result.code!}");
        userData.value = await UserRepository.getUserData(result.code!);

        if (userData.value != null) {
          Get.back(closeOverlays: true);
          if (userData.value!.service == 'Library') {
            Get.toNamed(AppPages.SURVEY_LIBRARY, arguments: userData.value);
          } else if (userData.value!.service == 'Admin Office') {
            Get.toNamed(AppPages.SURVEY_ADMIN_OFFICE,
                arguments: userData.value);
          } else if (userData.value!.service == 'Security Office') {
            Get.toNamed(AppPages.SURVEY_SECURITY_OFFICE,
                arguments: userData.value);
          } else if (userData.value!.service == 'Registrar') {
            Get.toNamed(AppPages.SURVEY_REGISTRAR_OFFICE,
                arguments: userData.value);
          } else if (userData.value!.service == 'Cashier') {
            Get.toNamed(AppPages.SURVEY_CASHIER, arguments: userData.value);
          }
        } else {
          _status.value = QRScanLoginControllerStatus.error;
          Get.snackbar(
            'Warning!',
            "Invalid QR Code or Already Used.",
            colorText: Colors.white,
            backgroundColor: Colors.lightBlue,
            icon: const Icon(Icons.add_alert),
          );
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
