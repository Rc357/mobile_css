import 'package:css/app/modules/survey/survey_security_office/controller/survey_controller.dart';
import 'package:get/instance_manager.dart';

class SurveySecurityOfficeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SurveySecurityOfficeController>(SurveySecurityOfficeController());
  }
}
