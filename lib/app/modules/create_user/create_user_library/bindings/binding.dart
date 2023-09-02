import 'package:css/app/modules/create_user/create_user_library/controller/create_user_library_controller.dart';
import 'package:get/instance_manager.dart';

class CreateUserLibraryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CreateUserLibraryController>(CreateUserLibraryController());
  }
}
