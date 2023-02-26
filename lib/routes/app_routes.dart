part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const START = _Paths.START;
  static const START_STUDENT = _Paths.START_STUDENT;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/splash';
  static const START = '/start';
  static const START_STUDENT = '/start_student';
}
