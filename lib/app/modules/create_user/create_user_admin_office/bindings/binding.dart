import 'package:css/app/modules/create_user/controller/course_and_year_controller.dart';
import 'package:css/app/modules/create_user/create_user_admin_office/controller/create_user_admin_office_controller.dart';
import 'package:get/instance_manager.dart';

class CreateUserAdminOfficeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CourseAndYearLevelController>(CourseAndYearLevelController(),
        permanent: true);
    Get.put<CreateUserAdminOfficeController>(CreateUserAdminOfficeController(),
        permanent: true);
  }
}
