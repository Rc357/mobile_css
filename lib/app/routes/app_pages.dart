import 'package:css/app/modules/create_user/create_user_admin_office/bindings/binding.dart';
import 'package:css/app/modules/create_user/create_user_admin_office/views/create_user_admin_office_view.dart';
import 'package:css/app/modules/create_user/create_user_cashier/bindings/binding.dart';
import 'package:css/app/modules/create_user/create_user_cashier/views/create_user_cashier_view.dart';
import 'package:css/app/modules/create_user/create_user_library/bindings/binding.dart';
import 'package:css/app/modules/create_user/create_user_library/views/create_user_library_view.dart';
import 'package:css/app/modules/create_user/create_user_registrar/bindings/binding.dart';
import 'package:css/app/modules/create_user/create_user_registrar/views/create_user_cashier_view.dart';
import 'package:css/app/modules/create_user/create_user_security_office/bindings/binding.dart';
import 'package:css/app/modules/create_user/create_user_security_office/views/create_user_cashier_view.dart';
import 'package:css/app/modules/survey_submitted/bindings/splash_binding.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:css/app/modules/generated_qr/bindings/generated_qr_binding.dart';
import 'package:css/app/modules/generated_qr/views/generated_qr_view.dart';
import 'package:css/app/modules/office_dashboard/office_dashboard.dart';
import 'package:css/app/modules/qr_scanner/bindings/qr_code_scanner_binding.dart';
import 'package:css/app/modules/qr_scanner/views/qr_code_scanner_view.dart';
import 'package:css/app/modules/survey_submitted/view/submitted_view.dart';
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
  static const OFFICE_DASHBOARD = Routes.OFFICE_DASHBOARD;
  static const CREATE_USER_LIBRARY = Routes.CREATE_USER_LIBRARY;
  static const CREATE_USER_ADMIN_OFFICE = Routes.CREATE_USER_ADMIN_OFFICE;
  static const CREATE_USER_CASHIER = Routes.CREATE_USER_CASHIER;
  static const CREATE_USER_REGISTRAR = Routes.CREATE_USER_REGISTRAR;
  static const CREATE_USER_SECURITY_OFFICE = Routes.CREATE_USER_SECURITY_OFFICE;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.OFFICE_DASHBOARD,
      page: () => const OfficeDashboardView(),
    ),
    GetPage(
      name: _Paths.CREATE_USER_LIBRARY,
      page: () => const CreateUserLibrary(),
      binding: CreateUserLibraryBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_USER_ADMIN_OFFICE,
      page: () => const CreateUserAdminOffice(),
      binding: CreateUserAdminOfficeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_USER_CASHIER,
      page: () => const CreateUserCashier(),
      binding: CreateUserCashierBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_USER_REGISTRAR,
      page: () => const CreateUserRegistrar(),
      binding: CreateUserRegistrarBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_USER_SECURITY_OFFICE,
      page: () => const CreateUserSecurityOffice(),
      binding: CreateUserSecurityOfficeBinding(),
    ),
    // GetPage(
    //   name: _Paths.START,
    //   page: () => const StartView(),
    //   binding: StartBinding(),
    // ),
    GetPage(
      name: _Paths.SURVEY_LIBRARY,
      page: () => const SurveyLibraryView(),
      binding: SurveyLibraryBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_ADMIN_OFFICE,
      page: () => const SurveyAdminOfficeView(),
      binding: SurveyAdminOfficeBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_SECURITY_OFFICE,
      page: () => const SurveySecurityOfficeView(),
      binding: SurveySecurityOfficeBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_REGISTRAR_OFFICE,
      page: () => const SurveyRegistrarOfficeView(),
      binding: SurveyRegistrarOfficeBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_CASHIER,
      page: () => const SurveyCashierOfficeView(),
      binding: SurveyCashierOfficeBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_SUBMITTED,
      page: () => const SubmittedView(),
      binding: MessageBinding(),
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
