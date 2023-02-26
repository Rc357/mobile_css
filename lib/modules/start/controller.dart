import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StartController extends GetxController {
  static StartController get instance => Get.find();

  final userType = ''.obs;

  void updateSelectedUserType(String selectedType) {
    print(selectedType);
    userType.value = selectedType;
    update();
  }
}
