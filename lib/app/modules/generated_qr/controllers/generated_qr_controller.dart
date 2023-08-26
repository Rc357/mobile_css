import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/user_model.dart';
import 'package:css/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum GeneratedQrControllerStatus { initial, loading, submitted, error }

class GeneratedQrController extends GetxController {
  static GeneratedQrController get instance => Get.find();
  late Worker _statusEverWorker;

  final currentUserData = Get.arguments as UserModel;

  final _status = GeneratedQrControllerStatus.initial.obs;

  bool get isLoading => _status.value == GeneratedQrControllerStatus.loading;

  final dateAndTime = ''.obs;

  String currentState() => 'SurveyLibraryController(Status: ${_status.value},)';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorSurveyFormStatus();
    setDateAndTime();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorSurveyFormStatus() {
    _statusEverWorker = ever(
      _status,
      (value) async {
        switch (value) {
          case GeneratedQrControllerStatus.error:
            MyLogger.printError(currentState());
            break;
          case GeneratedQrControllerStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case GeneratedQrControllerStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case GeneratedQrControllerStatus.submitted:
            MyLogger.printInfo(currentState());
            // Get.toNamed(AppPages.SURVEY_SUBMITTED);
            break;
        }
      },
    );
  }

  void setDateAndTime() {
    final dateCreate = DateFormat('yMMMMd').format(currentUserData.updatedAt);
    final timeCreate = DateFormat.jm().format(currentUserData.updatedAt);
    dateAndTime.value = '$dateCreate $timeCreate';
  }
}
