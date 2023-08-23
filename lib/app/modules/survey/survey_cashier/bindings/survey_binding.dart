import 'package:css/app/modules/survey/survey_cashier/controller/survey_controller.dart';
import 'package:get/instance_manager.dart';

class SurveyCashierOfficeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SurveyCashierOfficeController>(SurveyCashierOfficeController());
  }
}
