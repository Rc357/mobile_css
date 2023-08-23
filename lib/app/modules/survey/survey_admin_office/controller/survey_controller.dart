import 'package:css/app/enum/survey_enum.dart';
import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/survey_admin_office_model.dart';
import 'package:css/app/models/survey_library_model.dart';
import 'package:css/app/models/survey_remarks.dart';
import 'package:css/app/repositories/survey_remarks_repository.dart';
import 'package:css/app/repositories/survey_repository.dart';
import 'package:css/app/routes/app_pages.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SurveyAdminOfficeStatus { initial, loading, submitted, error }

class SurveyAdminOfficeController extends GetxController {
  static SurveyAdminOfficeController get instance => Get.find();
  late Worker _statusEverWorker;
  final userId = ''.obs;

  final _status = SurveyAdminOfficeStatus.initial.obs;

  final expandableController = ExpandableController().obs;
  final userType = ''.obs;
  final question1 = SurveyEnum.unknown.obs;
  final question2 = SurveyEnum.unknown.obs;
  final optional = ''.obs;

  final isLibraryExpanded = false.obs;

  bool get isLoading => _status.value == SurveyAdminOfficeStatus.loading;

  String currentState() =>
      'SurveyAdminOfficeController(Status: ${_status.value}, UserId: ${userId.value} Question1: ${question1.value}, Question2: ${question2.value}, Optional: ${optional.value} )';

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
          case SurveyAdminOfficeStatus.error:
            MyLogger.printError(currentState());
            break;
          case SurveyAdminOfficeStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case SurveyAdminOfficeStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case SurveyAdminOfficeStatus.submitted:
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

  void setOptionalValue(String text) {
    optional.value = text;
    MyLogger.printInfo(currentState());
  }

  Future<void> submitData() async {
    _status.value = SurveyAdminOfficeStatus.loading;
    if (question1.value == SurveyEnum.unknown ||
        question2.value == SurveyEnum.unknown) {
      Get.snackbar(
        'Warning!',
        "Please make sure all data is valid.",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );

      _status.value = SurveyAdminOfficeStatus.error;
    } else {
      final userData = SurveyAdminOfficeModel(
          id: 'adminOffice_${userId.value}',
          userId: userId.value,
          question1: question1.value.description,
          question2: question2.value.description,
          remarks: optional.value,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      await SurveyRepository.createSurveyAdminOffice(userData);

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
      _status.value = SurveyAdminOfficeStatus.submitted;
    }
  }
}
