import 'package:css/app/modules/create_user/controller/course_and_year_controller.dart';
import 'package:css/app/modules/create_user/create_user_library/controller/create_user_library_controller.dart';
import 'package:get/instance_manager.dart';

class CreateUserLibraryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CourseAndYearLevelController>(CourseAndYearLevelController(),
        permanent: true);
    Get.put<CreateUserLibraryController>(CreateUserLibraryController(),
        permanent: true);
  }
}
