import 'package:css/app/modules/survey/survey_library/controller/survey_controller.dart';
import 'package:get/instance_manager.dart';

class SurveyLibraryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SurveyLibraryController>(SurveyLibraryController());
  }
}
