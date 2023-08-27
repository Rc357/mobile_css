import 'dart:typed_data';

import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

enum GeneratedQrControllerStatus { initial, loading, submitted, error }

class GeneratedQrController extends GetxController {
  static GeneratedQrController get instance => Get.find();
  late Worker _statusEverWorker;

  final currentUserData = Get.arguments as UserModel;

  final _status = GeneratedQrControllerStatus.initial.obs;

  bool get isLoading => _status.value == GeneratedQrControllerStatus.loading;

  final dateAndTime = ''.obs;

  ScreenshotController screenshotController = ScreenshotController();

  String currentState() => 'SurveyLibraryController(Status: ${_status.value},)';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorSurveyFormStatus();
    setDateAndTime();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorSurveyFormStatus() {
    _statusEverWorker = ever(
      _status,
      (value) async {
        switch (value) {
          case GeneratedQrControllerStatus.error:
            MyLogger.printError(currentState());
            break;
          case GeneratedQrControllerStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case GeneratedQrControllerStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case GeneratedQrControllerStatus.submitted:
            MyLogger.printInfo(currentState());
            // Get.toNamed(AppPages.SURVEY_SUBMITTED);
            break;
        }
      },
    );
  }

  void setDateAndTime() {
    final dateCreate = DateFormat('yMMMMd').format(currentUserData.updatedAt);
    final timeCreate = DateFormat.jm().format(currentUserData.updatedAt);
    dateAndTime.value = '$dateCreate $timeCreate';
  }

  void captureSaveQR() {
    screenshotController.capture().then((Uint8List? qrImage) async {
      if (qrImage != null) {
        try {
          await ImageGallerySaver.saveImage(qrImage);
          Get.snackbar(
            'Success',
            "Your QR code save on your gallery.",
            colorText: Colors.white,
            backgroundColor: Colors.lightBlue,
            icon: const Icon(Icons.add_alert),
          );
          MyLogger.printInfo('Save QR IMAGE');
        } catch (e) {
          MyLogger.printInfo('Save QR IMAGE ERROR: $e');
        }
      }
    });
  }
}
