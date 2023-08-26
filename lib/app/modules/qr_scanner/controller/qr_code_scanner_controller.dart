import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

enum QRScanLoginControllerStatus { initial, loading, loaded, error }

class QRScanLoginController extends GetxController {
  static QRScanLoginController get instance => Get.find();
  late Worker _statusEverWorker;
  final _status = QRScanLoginControllerStatus.initial.obs;
  bool get isLoading => _status.value == QRScanLoginControllerStatus.loading;

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
      _status.value = QRScanLoginControllerStatus.loading;

      // checkInternet();
      // AdminsUser? adminUser = await UserService().loginQRService(result.code!);
      // if (adminUser.name == 'no_result') {
      //   _status.value = QRScanLoginControllerStatus.loaded;
      //   Get.snackbar('Error', 'QR code is not recognize.');
      // }
      // if (adminUser.roleId == '5') {
      //   // Navigator.popAndPushNamed(context, "/main_customer");
      //   Get.toNamed(AppPages.MAIN_CUSTOMER);
      //   final SharedPreferences sharedPreferences =
      //       await SharedPreferences.getInstance();
      //   sharedPreferences.setString("emailKey", adminUser.email!);
      //   constantController.isCustomer.value = 1;
      // } else {
      //   final SharedPreferences sharedPreferences =
      //       await SharedPreferences.getInstance();
      //   sharedPreferences.setString("emailKey", adminUser.email!);

      //   List<PosUserModel> posData = await GetPosUserViaEmailService()
      //       .getPosUserViaEmailService(
      //           sharedPreferences.getString("emailKey")!);
      //   constantController.isCustomer.value = 0;
      //   constantController.POS_USER_DATA.value = posData[0];
      //   Get.toNamed(AppPages.MAIN);
      // }
    }
  }
}
