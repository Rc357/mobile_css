import 'package:css/app/modules/survey/survey_admin_office/controller/survey_controller.dart';
import 'package:get/instance_manager.dart';

class SurveyAdminOfficeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SurveyAdminOfficeController>(SurveyAdminOfficeController());
  }
}
