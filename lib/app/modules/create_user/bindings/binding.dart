import 'package:css/app/modules/create_user/controller/controller.dart';
import 'package:get/instance_manager.dart';

class StartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<StartController>(StartController());
  }
}
