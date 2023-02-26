import 'package:css/modules/splash/views/splash_view.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:css/modules/start/binding.dart';
import 'package:css/modules/start/start_view.dart';
import 'package:css/modules/start/student/start_student_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const SPLASH = Routes.SPLASH;
  static const START = Routes.START;
  static const START_STUDENT = Routes.START_STUDENT;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.START,
      page: () => const StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.START_STUDENT,
      page: () => const StartStudentView(),
      binding: StartBinding(),
    ),
  ];
}
