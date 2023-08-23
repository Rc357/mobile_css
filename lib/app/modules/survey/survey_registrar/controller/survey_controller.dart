import 'package:css/app/enum/survey_enum.dart';
import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/survey_library_model.dart';
import 'package:css/app/models/survey_remarks.dart';
import 'package:css/app/repositories/survey_remarks_repository.dart';
import 'package:css/app/repositories/survey_repository.dart';
import 'package:css/app/routes/app_pages.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SurveyRegistrarOfficeStatus { initial, loading, submitted, error }

class SurveyRegistrarOfficeController extends GetxController {
  static SurveyRegistrarOfficeController get instance => Get.find();
  late Worker _statusEverWorker;
  final userId = ''.obs;

  final _status = SurveyRegistrarOfficeStatus.initial.obs;

  final expandableController = ExpandableController().obs;
  final userType = ''.obs;
  final question1 = SurveyEnum.unknown.obs;
  final question2 = SurveyEnum.unknown.obs;
  final question3 = SurveyEnum.unknown.obs;
  final question4 = SurveyEnum.unknown.obs;
  final optional = ''.obs;

  final isLibraryExpanded = false.obs;

  bool get isLoading => _status.value == SurveyRegistrarOfficeStatus.loading;

  String currentState() =>
      'SurveyRegistrarOfficeController(Status: ${_status.value}, Question1: ${question1.value}, Question2: ${question2.value}, Question3: ${question3.value}, Question4: ${question4.value}, Optional: ${optional.value} )';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorSurveyFormStatus();
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
          case SurveyRegistrarOfficeStatus.error:
            MyLogger.printError(currentState());
            break;
          case SurveyRegistrarOfficeStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case SurveyRegistrarOfficeStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case SurveyRegistrarOfficeStatus.submitted:
            MyLogger.printInfo(currentState());
            Get.toNamed(AppPages.SURVEY_SUBMITTED);
            break;
        }
      },
    );
  }

  void updateSelectedUserType(String selectedType) {
    userType.value = selectedType;
    update();
  }

  void changeExpandableStatus() {
    expandableController.value.expanded = !expandableController.value.expanded;
    isLibraryExpanded.value = !isLibraryExpanded.value;
  }

  void setQuestion1Value(SurveyEnum answer) {
    question1.value = answer;
    MyLogger.printInfo(currentState());
  }

  void setQuestion2Value(SurveyEnum answer) {
    question2.value = answer;
    MyLogger.printInfo(currentState());
  }

  void setQuestion3Value(SurveyEnum answer) {
    question3.value = answer;
    MyLogger.printInfo(currentState());
  }

  void setQuestion4Value(SurveyEnum answer) {
    question4.value = answer;
    MyLogger.printInfo(currentState());
  }

  void setOptionalValue(String text) {
    optional.value = text;
    MyLogger.printInfo(currentState());
  }

  Future<void> submitData() async {
    _status.value = SurveyRegistrarOfficeStatus.loading;
    if (question1.value == SurveyEnum.unknown ||
        question2.value == SurveyEnum.unknown ||
        question3.value == SurveyEnum.unknown ||
        question4.value == SurveyEnum.unknown) {
      Get.snackbar(
        'Warning!',
        "Please make sure all data is valid.",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );

      _status.value = SurveyRegistrarOfficeStatus.error;
    } else {
      final userData = SurveyLibraryModel(
          id: 'registrar_${userId.value}',
          userId: userId.value,
          question1: question1.value.description,
          question2: question2.value.description,
          question3: question3.value.description,
          question4: question4.value.description,
          remarks: optional.value,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      await SurveyRepository.createSurveyRegistrarOffice(userData);
      if (optional.isNotEmpty) {
        final remark = SurveyRemarksModel(
          id: 'remarks_${userId.value}',
          remarks: optional.value,
          reference: userId.value,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await SurveyRemarksRepository.createSurveyRemarks(remark);
      }
      _status.value = SurveyRegistrarOfficeStatus.submitted;
    }
  }
}
