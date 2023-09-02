import 'package:css/app/modules/survey_submitted/controller/message_controller.dart';
import 'package:get/instance_manager.dart';

class MessageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MessageController>(MessageController());
  }
}
