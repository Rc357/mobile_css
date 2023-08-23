import 'package:css/app/modules/login/controller.dart';
import 'package:get/instance_manager.dart';

class StartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<StartController>(StartController());
  }
}
