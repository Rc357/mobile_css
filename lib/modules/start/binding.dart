import 'package:get/instance_manager.dart';
import 'package:css/modules/start/controller.dart';

class StartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<StartController>(StartController());
  }
}
