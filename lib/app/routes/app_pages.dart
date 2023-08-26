import 'package:css/app/modules/generated_qr/bindings/generated_qr_binding.dart';
import 'package:css/app/modules/generated_qr/views/generated_qr_view.dart';
import 'package:css/app/modules/qr_scanner/bindings/qr_code_scanner_binding.dart';
import 'package:css/app/modules/qr_scanner/views/qr_code_scanner_view.dart';
import 'package:css/app/modules/survey/submitted_view.dart';
import 'package:css/app/modules/survey/survey_admin_office/bindings/survey_binding.dart';
import 'package:css/app/modules/survey/survey_admin_office/views/survey_view.dart';
import 'package:css/app/modules/survey/survey_cashier/bindings/survey_binding.dart';
import 'package:css/app/modules/survey/survey_cashier/views/survey_view.dart';
import 'package:css/app/modules/survey/survey_library/bindings/survey_binding.dart';
import 'package:css/app/modules/survey/survey_library/views/survey_view.dart';
import 'package:css/app/modules/survey/survey_registrar/bindings/survey_binding.dart';
import 'package:css/app/modules/survey/survey_registrar/views/survey_view.dart';
import 'package:css/app/modules/survey/survey_security_office/bindings/survey_binding.dart';
import 'package:css/app/modules/survey/survey_security_office/views/survey_view.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../modules/home/bindings/binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/binding.dart';
import '../modules/login/start_view.dart';
import '../modules/login/student/start_student_view.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const SPLASH = Routes.SPLASH;
  static const START = Routes.START;
  static const HOME = Routes.HOME;
  static const START_STUDENT = Routes.START_STUDENT;
  static const SURVEY_LIBRARY = Routes.SURVEY_LIBRARY;
  static const SURVEY_ADMIN_OFFICE = Routes.SURVEY_ADMIN_OFFICE;
  static const SURVEY_SECURITY_OFFICE = Routes.SURVEY_SECURITY_OFFICE;
  static const SURVEY_REGISTRAR_OFFICE = Routes.SURVEY_REGISTRAR_OFFICE;
  static const SURVEY_CASHIER = Routes.SURVEY_CASHIER;
  static const SURVEY_SUBMITTED = Routes.SURVEY_SUBMMITED;
  static const GENERATED_QR = Routes.GENERATED_QR;
  static const QR_SCANNER_LOGIN = Routes.QR_SCANNER_LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => HomeView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: _Paths.START,
      page: () => const StartView(),
      binding: StartBinding(),
    ),
    // GetPage(
    //   name: _Paths.START_STUDENT,
    //   page: () => const StartStudentView(),
    //   binding: StartBinding(),
    // ),
    GetPage(
      name: _Paths.SURVEY_LIBRARY,
      page: () => SurveyLibraryView(),
      binding: SurveyLibraryBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_ADMIN_OFFICE,
      page: () => SurveyAdminOfficeView(),
      binding: SurveyAdminOfficeBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_SECURITY_OFFICE,
      page: () => SurveySecurityOfficeView(),
      binding: SurveySecurityOfficeBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_REGISTRAR_OFFICE,
      page: () => SurveyRegistrarOfficeView(),
      binding: SurveyRegistrarOfficeBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_CASHIER,
      page: () => SurveyCashierOfficeView(),
      binding: SurveyCashierOfficeBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_SUBMITTED,
      page: () => SubmittedView(),
    ),
    GetPage(
      name: _Paths.QR_SCANNER_LOGIN,
      page: () => const QRScanLoginView(),
      binding: QRScanLoginBinding(),
    ),
    GetPage(
      name: _Paths.GENERATED_QR,
      page: () => const GeneratedQrView(),
      binding: GeneratedQrBinding(),
    ),
  ];
}
