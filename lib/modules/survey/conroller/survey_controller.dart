import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SurveyController extends GetxController {
  static SurveyController get instance => Get.find();

  final userType = ''.obs;

  void updateSelectedUserType(String selectedType) {
    userType.value = selectedType;
    update();
  }
}
