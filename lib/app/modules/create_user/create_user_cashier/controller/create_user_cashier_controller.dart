import 'package:css/app/enum/course_enum.dart';
import 'package:css/app/enum/type_user_enum.dart';
import 'package:css/app/enum/year_level_enum.dart';
import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/user_cashier_model.dart';
import 'package:css/app/modules/create_user/controller/course_and_year_controller.dart';
import 'package:css/app/repositories/user_repository.dart';
import 'package:css/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CreateUserCashierStatus { initial, loading, submitted, error }

class CreateUserCashierController extends GetxController {
  static CreateUserCashierController get instance => Get.find();
  late Worker _statusEverWorker;

  final courseAndYearLevelController = CourseAndYearLevelController.instance;

  final _status = CreateUserCashierStatus.initial.obs;

  final _name = ''.obs;
  final _course = CourseEnum.unknown.obs;
  final _yearLevel = YearLevelEnum.unknown.obs;
  final _userType = UserTypeEnum.unknown.obs;

  final isUserExpanded = false.obs;
  final isServiceExpanded = false.obs;
  final _userCashierData = Rxn<UserCashierModel>();

  bool get isLoading => _status.value == CreateUserCashierStatus.loading;

  String currentState() =>
      'CreateUserAdminOfficeController(Name: ${_name.value}, Course: ${_course.value}, Year Level: ${_yearLevel.value}, User Type: ${_userType.value},)';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorStartFormStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorStartFormStatus() {
    _statusEverWorker = ever(
      _status,
      (value) async {
        switch (value) {
          case CreateUserCashierStatus.error:
            MyLogger.printError(currentState());
            break;
          case CreateUserCashierStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case CreateUserCashierStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case CreateUserCashierStatus.submitted:
            MyLogger.printInfo(currentState());
            Get.offAndToNamed(AppPages.SURVEY_CASHIER,
                arguments: _userCashierData.value);
            break;
        }
      },
    );
  }

  void setNameValue(String name) {
    _name.value = name;
    MyLogger.printInfo(currentState());
  }

  void setCourseValue(CourseEnum course) {
    _course.value = course;
    MyLogger.printInfo(currentState());
  }

  void setYearLevelValue(YearLevelEnum yearLevel) {
    _yearLevel.value = yearLevel;
    MyLogger.printInfo(currentState());
  }

  void setUserTypeValue(UserTypeEnum userType) {
    _userType.value = userType;
    MyLogger.printInfo(currentState());
  }

  Future<void> proceedToCashier() async {
    _status.value = CreateUserCashierStatus.loading;
    if (_name.value.isEmpty ||
        _course.value == CourseEnum.unknown ||
        _yearLevel.value == YearLevelEnum.unknown ||
        _userType.value == UserTypeEnum.unknown) {
      Get.snackbar(
        'Warning!',
        "Please make sure all data is valid.",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );

      _status.value = CreateUserCashierStatus.error;
    } else {
      MyLogger.printInfo("Proceed to save data");

      final userData = UserCashierModel(
          uid: '',
          name: _name.value.capitalizeFirst!,
          course: _course.value,
          yearLevel: _yearLevel.value,
          userType: _userType.value,
          answered: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());

      _userCashierData.value =
          await UserRepository.createUserCashierToSurvey(userData);
      _status.value = CreateUserCashierStatus.submitted;
    }
  }
}
