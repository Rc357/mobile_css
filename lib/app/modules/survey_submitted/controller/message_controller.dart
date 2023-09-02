import 'package:css/app/enum/offices_key_enum.dart';
import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/thank_you_message_model.dart';
import 'package:css/app/repositories/questions_repository.dart';
import 'package:get/get.dart';

enum MessageControllerStatus { initial, loading, loaded, error }

class MessageController extends GetxController {
  static MessageController get instance => Get.find();
  late Worker _statusEverWorker;
  final _status = MessageControllerStatus.initial.obs;
  bool get isLoading => _status.value == MessageControllerStatus.loading;

  final allMessages = <ThankYouMessageModel>[].obs;

  final officeQR = Get.arguments as OfficeQRData;
  final officeName = ''.obs;

  String currentState() => 'Controller(_status: ${_status.value},)';

  @override
  void onInit() {
    _monitorFeedbackFormStatus();
    getMessages();
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
          case MessageControllerStatus.error:
            MyLogger.printError(currentState());
            break;
          case MessageControllerStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case MessageControllerStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case MessageControllerStatus.loaded:
            MyLogger.printInfo(currentState());
            break;
        }
      },
    );
  }

  void getMessages() async {
    if (officeQR == OfficeQRData.adminsOffice) {
      officeName.value = 'regardsAdminsOffice';
    } else if (officeQR == OfficeQRData.securityOffice) {
      officeName.value = 'regardsSecurityOffice';
    } else {
      officeName.value = 'regards${officeQR.name.capitalizeFirst}';
    }

    MyLogger.printInfo('office: $officeName');
    try {
      _status.value = MessageControllerStatus.loading;
      allMessages.value =
          await QuestionsRepository.getMessages(officeName.value);

      _status.value = MessageControllerStatus.loaded;
    } catch (e) {
      MyLogger.printError("getMessages Error: $e");
      _status.value = MessageControllerStatus.error;
    }
  }
}
