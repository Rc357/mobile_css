import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:get/get.dart';

enum ControllerStatus { initial, loading, loaded, error }

class Controller extends GetxController {
  static Controller get instance => Get.find();
  late Worker _statusEverWorker;
  final _status = ControllerStatus.initial.obs;
  bool get isLoading => _status.value == ControllerStatus.loading;

  String currentState() => 'Controller(_status: ${_status.value},)';

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
          case ControllerStatus.error:
            MyLogger.printError(currentState());
            break;
          case ControllerStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case ControllerStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case ControllerStatus.loaded:
            MyLogger.printInfo(currentState());
            break;
        }
      },
    );
  }
}
