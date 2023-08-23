import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class AppSnackbar {
  static void showSuccessInfo({
    String? title,
    required String message,
  }) {
    Get.snackbar(
      title ?? 'Well Done',
      message,
      icon: const Icon(LineIcons.check),
    );
  }

  static void showWarningInfo({
    String? title,
    required String message,
  }) {
    Get.snackbar(
      title ?? 'Warning',
      message,
      icon: const Icon(LineIcons.exclamationTriangle),
    );
  }

  static void showErrorInfo({
    String? title,
    required String message,
  }) {
    Get.snackbar(
      title ?? 'Error',
      message,
      icon: const Icon(LineIcons.times),
    );
  }
}
