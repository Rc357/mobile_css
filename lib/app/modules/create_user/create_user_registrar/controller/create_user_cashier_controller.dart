import 'package:css/app/enum/course_enum.dart';
import 'package:css/app/enum/type_user_enum.dart';
import 'package:css/app/enum/year_level_enum.dart';
import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/user_registrar_model.dart';
import 'package:css/app/modules/create_user/controller/course_and_year_controller.dart';
import 'package:css/app/repositories/user_repository.dart';
import 'package:css/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CreateUserRegistrarStatus { initial, loading, submitted, error }

class CreateUserRegistrarController extends GetxController {
  static CreateUserRegistrarController get instance => Get.find();
  late Worker _statusEverWorker;

  final courseAndYearLevelController = CourseAndYearLevelController.instance;

  final _status = CreateUserRegistrarStatus.initial.obs;

  final _name = ''.obs;
  final _course = CourseEnum.unknown.obs;
  final _yearLevel = YearLevelEnum.unknown.obs;
  final _userType = UserTypeEnum.unknown.obs;

  final isUserExpanded = false.obs;
  final isServiceExpanded = false.obs;
  final _userRegistrarData = Rxn<UserRegistrarModel>();
  final _studentId = ''.obs;

  UserTypeEnum get userType => _userType.value;

  bool get isLoading => _status.value == CreateUserRegistrarStatus.loading;

  String currentState() =>
      'CreateUserRegistrarController(Name: ${_name.value}, Course: ${_course.value}, Year Level: ${_yearLevel.value}, User Type: ${_userType.value},)';

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
          case CreateUserRegistrarStatus.error:
            MyLogger.printError(currentState());
            break;
          case CreateUserRegistrarStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case CreateUserRegistrarStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case CreateUserRegistrarStatus.submitted:
            MyLogger.printInfo(currentState());
            Get.offAndToNamed(AppPages.SURVEY_REGISTRAR_OFFICE,
                arguments: _userRegistrarData.value);
            break;
        }
      },
    );
  }

  void setNameValue(String name) {
    _name.value = name;
    MyLogger.printInfo(currentState());
  }

  void setStudentId(String id) {
    _studentId.value = id;
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

  Future<void> proceedToRegistrar() async {
    _status.value = CreateUserRegistrarStatus.loading;

    if (_userType.value == UserTypeEnum.parents ||
        _userType.value == UserTypeEnum.guest) {
      if (_userType.value == UserTypeEnum.unknown) {
        Get.snackbar(
          'Warning!',
          "Please make sure all data is valid.",
          colorText: Colors.white,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.add_alert),
        );

        _status.value = CreateUserRegistrarStatus.error;
      } else {
        _course.value = CourseEnum.unknown;
        _yearLevel.value = YearLevelEnum.unknown;
        MyLogger.printInfo("Proceed to save data");

        final userData = UserRegistrarModel(
            uid: '',
            name: _name.value,
            course: _course.value,
            yearLevel: _yearLevel.value,
            userType: _userType.value,
            studentId: _studentId.value,
            answered: false,
            version: 0,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now());

        _userRegistrarData.value =
            await UserRepository.createUserRegistrarToSurvey(userData);
        _status.value = CreateUserRegistrarStatus.submitted;
      }
    } else if (_userType.value == UserTypeEnum.alumni) {
      if (_userType.value == UserTypeEnum.unknown ||
          _course.value == CourseEnum.unknown ||
          _studentId.value.isEmpty) {
        Get.snackbar(
          'Warning!',
          "Please make sure all data is valid.",
          colorText: Colors.white,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.add_alert),
        );

        _status.value = CreateUserRegistrarStatus.error;
      } else {
        _yearLevel.value = YearLevelEnum.unknown;
        MyLogger.printInfo("Proceed to save data");

        final userData = UserRegistrarModel(
            uid: '',
            name: _name.value,
            course: _course.value,
            yearLevel: _yearLevel.value,
            userType: _userType.value,
            studentId: _studentId.value,
            answered: false,
            version: 0,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now());

        _userRegistrarData.value =
            await UserRepository.createUserRegistrarToSurvey(userData);
        _status.value = CreateUserRegistrarStatus.submitted;
      }
    } else {
      if (_course.value == CourseEnum.unknown ||
          _yearLevel.value == YearLevelEnum.unknown ||
          _userType.value == UserTypeEnum.unknown) {
        Get.snackbar(
          'Warning!',
          "Please make sure all data is valid.",
          colorText: Colors.white,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.add_alert),
        );

        _status.value = CreateUserRegistrarStatus.error;
      } else {
        MyLogger.printInfo("Proceed to save data");

        final userData = UserRegistrarModel(
            uid: '',
            name: _name.value,
            course: _course.value,
            yearLevel: _yearLevel.value,
            userType: _userType.value,
            studentId: _studentId.value,
            answered: false,
            version: 0,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now());

        _userRegistrarData.value =
            await UserRepository.createUserRegistrarToSurvey(userData);
        _status.value = CreateUserRegistrarStatus.submitted;
      }
    }
  }
}
