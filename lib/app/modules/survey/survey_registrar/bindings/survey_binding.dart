import 'package:css/app/modules/survey/survey_library/controller/survey_controller.dart';
import 'package:css/app/modules/survey/survey_registrar/controller/survey_controller.dart';
import 'package:get/instance_manager.dart';

class SurveyRegistrarOfficeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SurveyRegistrarOfficeController>(SurveyRegistrarOfficeController());
  }
}
