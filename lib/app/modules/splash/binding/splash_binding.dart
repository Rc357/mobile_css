import 'package:css/app/modules/splash/controller/splash_controller.dart';
import 'package:css/app/modules/survey/survey_admin_office/controller/survey_controller.dart';
import 'package:css/app/modules/survey/survey_cashier/controller/survey_controller.dart';
import 'package:css/app/modules/survey/survey_library/controller/survey_controller.dart';
import 'package:css/app/modules/survey/survey_registrar/controller/survey_controller.dart';
import 'package:css/app/modules/survey/survey_security_office/controller/survey_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<SurveyLibraryController>(SurveyLibraryController());
    Get.put<SurveyAdminOfficeController>(SurveyAdminOfficeController());
    Get.put<SurveySecurityOfficeController>(SurveySecurityOfficeController());
    Get.put<SurveyRegistrarOfficeController>(SurveyRegistrarOfficeController());
    Get.put<SurveyCashierOfficeController>(SurveyCashierOfficeController());
  }
}
