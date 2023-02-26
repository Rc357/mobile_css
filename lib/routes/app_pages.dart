import 'package:css/modules/home/bindings/binding.dart';
import 'package:css/modules/home/views/home_view.dart';
import 'package:css/modules/splash/binding/splash_binding.dart';
import 'package:css/modules/splash/views/splash_view.dart';
import 'package:css/modules/survey/bindings/survey_binding.dart';
import 'package:css/modules/survey/views/survey_view.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:css/modules/start/binding.dart';
import 'package:css/modules/start/start_view.dart';
import 'package:css/modules/start/student/start_student_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const SPLASH = Routes.SPLASH;
  static const START = Routes.START;
  static const HOME = Routes.HOME;
  static const START_STUDENT = Routes.START_STUDENT;
  static const SURVEY_PAGE = Routes.SURVEY_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
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
    GetPage(
      name: _Paths.SURVEY_PAGE,
      page: () => SurveyView(),
      binding: SurveyBinding(),
    ),
  ];
}
