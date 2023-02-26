import 'package:css/modules/survey/conroller/survey_controller.dart';
import 'package:get/instance_manager.dart';

class SurveyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SurveyController>(SurveyController());
  }
}
