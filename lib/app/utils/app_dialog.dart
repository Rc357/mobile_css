import 'package:css/app/modules/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static void show({
    required String title,
    required String middleText,
    required bool withCancelButton,
    required VoidCallback confirmButtonOnPressed,
    String? confirmButtonText,
    double? buttonTextFontSize,
    String? cancelButtonText,
  }) {
    Get.defaultDialog(
      barrierDismissible: false,
      onWillPop: () async => false,
      titlePadding: const EdgeInsets.only(top: 30),
      contentPadding: const EdgeInsets.all(30),
      title: title,
      middleText: middleText,
      actions: [
        RoundedButton(
          onPressed: confirmButtonOnPressed,
          text: confirmButtonText ?? 'YES',
          hasGradient: true,
          textColor: Colors.white,
          textSize: buttonTextFontSize ?? 16,
          fontWeight: FontWeight.w300,
          buttonHeight: 40,
        ),
        if (withCancelButton)
          RoundedButton(
            onPressed: Get.back,
            text: cancelButtonText ?? 'NO',
            hasGradient: false,
            textColor: Colors.black,
            textSize: buttonTextFontSize ?? 16,
            fontWeight: FontWeight.w300,
            buttonHeight: 40,
          ),
      ],
    );
  }
}
