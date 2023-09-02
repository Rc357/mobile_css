part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const START = _Paths.START;
  static const HOME = _Paths.HOME;
  static const START_STUDENT = _Paths.START_STUDENT;
  static const SURVEY_LIBRARY = _Paths.SURVEY_LIBRARY;
  static const SURVEY_ADMIN_OFFICE = _Paths.SURVEY_ADMIN_OFFICE;
  static const SURVEY_SECURITY_OFFICE = _Paths.SURVEY_SECURITY_OFFICE;
  static const SURVEY_REGISTRAR_OFFICE = _Paths.SURVEY_REGISTRAR_OFFICE;
  static const SURVEY_CASHIER = _Paths.SURVEY_CASHIER;
  static const SURVEY_SUBMMITED = _Paths.SURVEY_SUBMITTED;
  static const GENERATED_QR = _Paths.GENERATED_QR;
  static const QR_SCANNER_LOGIN = _Paths.QR_SCANNER_LOGIN;
  static const OFFICE_DASHBOARD = _Paths.OFFICE_DASHBOARD;
  static const CREATE_USER_LIBRARY = _Paths.CREATE_USER_LIBRARY;
  static const CREATE_USER_ADMIN_OFFICE = _Paths.CREATE_USER_ADMIN_OFFICE;
  static const CREATE_USER_CASHIER = _Paths.CREATE_USER_CASHIER;
  static const CREATE_USER_REGISTRAR = _Paths.CREATE_USER_REGISTRAR;
  static const CREATE_USER_SECURITY_OFFICE = _Paths.CREATE_USER_SECURITY_OFFICE;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/splash';
  static const START = '/start';
  static const HOME = '/home';
  static const START_STUDENT = '/start_student';
  static const SURVEY_LIBRARY = '/survey_library';
  static const SURVEY_ADMIN_OFFICE = '/survey_admin_office';
  static const SURVEY_SECURITY_OFFICE = '/survey_security_office';
  static const SURVEY_REGISTRAR_OFFICE = '/survey_registrar_office';
  static const SURVEY_CASHIER = '/survey_cashier';
  static const SURVEY_SUBMITTED = '/survey_submitted';
  static const GENERATED_QR = '/generated-qr';
  static const QR_SCANNER_LOGIN = '/qr-scanner-login';
  static const OFFICE_DASHBOARD = '/office-dashboard';
  static const CREATE_USER_LIBRARY = '/create-user-library';
  static const CREATE_USER_ADMIN_OFFICE = '/create-user-admin-office';
  static const CREATE_USER_CASHIER = '/create-user-cashier';
  static const CREATE_USER_REGISTRAR = '/create-user-registrar';
  static const CREATE_USER_SECURITY_OFFICE = '/create-user-security-office';
}
