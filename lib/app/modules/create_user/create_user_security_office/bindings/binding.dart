import 'package:css/app/modules/create_user/controller/course_and_year_controller.dart';
import 'package:css/app/modules/create_user/create_user_security_office/controller/create_user_cashier_controller.dart';
import 'package:get/instance_manager.dart';

class CreateUserSecurityOfficeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CourseAndYearLevelController>(CourseAndYearLevelController(),
        permanent: true);
    Get.put<CreateUserSecurityOfficeController>(
        CreateUserSecurityOfficeController(),
        permanent: true);
  }
}
