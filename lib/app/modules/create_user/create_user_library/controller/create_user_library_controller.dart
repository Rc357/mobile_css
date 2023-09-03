import 'package:css/app/enum/course_enum.dart';
import 'package:css/app/enum/gender_enum.dart';
import 'package:css/app/enum/type_user_enum.dart';
import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/user_library_model.dart';
import 'package:css/app/modules/create_user/controller/course_and_year_controller.dart';
import 'package:css/app/repositories/user_repository.dart';
import 'package:css/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CreateUserLibraryStatus { initial, loading, submitted, error }

class CreateUserLibraryController extends GetxController {
  static CreateUserLibraryController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = CreateUserLibraryStatus.initial.obs;
  final courseAndYearLevelController = CourseAndYearLevelController.instance;

  final _name = ''.obs;
  final _course = CourseEnum.unknown.obs;
  final _contact = ''.obs;
  final _gender = GenderEnum.unknown.obs;
  final _userType = UserTypeEnum.unknown.obs;
  final isUserExpanded = false.obs;
  final isServiceExpanded = false.obs;
  final userLibraryData = Rxn<UserLibraryModel>();

  bool get isLoading => _status.value == CreateUserLibraryStatus.loading;

  String currentState() =>
      'CreateUserLibraryController(Name: ${_name.value}, Course: ${_course.value}, Contact: ${_contact.value}, Gender: ${_gender.value}, User Type: ${_userType.value},)';

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
          case CreateUserLibraryStatus.error:
            MyLogger.printError(currentState());
            break;
          case CreateUserLibraryStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case CreateUserLibraryStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case CreateUserLibraryStatus.submitted:
            MyLogger.printInfo(currentState());
            Get.offAndToNamed(AppPages.SURVEY_LIBRARY,
                arguments: userLibraryData.value);
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

  void setGenderValue(GenderEnum gender) {
    _gender.value = gender;
    MyLogger.printInfo(currentState());
  }

  void setUserTypeValue(UserTypeEnum userType) {
    _userType.value = userType;
    MyLogger.printInfo(currentState());
  }

  void setContactValue(String contact) {
    _contact.value = contact;
    MyLogger.printInfo(currentState());
  }

  Future<void> proceedToLibrary() async {
    _status.value = CreateUserLibraryStatus.loading;

    if (_userType.value == UserTypeEnum.alumni ||
        _userType.value == UserTypeEnum.parents ||
        _userType.value == UserTypeEnum.guest) {
      if (_name.value.isEmpty ||
          _contact.value.isEmpty ||
          _userType.value == UserTypeEnum.unknown ||
          _gender.value == GenderEnum.unknown) {
        Get.snackbar(
          'Warning!',
          "Please make sure all data is valid.",
          colorText: Colors.white,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.add_alert),
        );

        _status.value = CreateUserLibraryStatus.error;
      } else {
        _course.value = CourseEnum.unknown;
        MyLogger.printInfo("Proceed to save data");

        final userData = UserLibraryModel(
            uid: '',
            name: _name.value,
            contact: _contact.value,
            course: _course.value,
            gender: _gender.value,
            userType: _userType.value,
            answered: false,
            version: 0,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now());
        userLibraryData.value =
            await UserRepository.createUserLibraryToSurvey(userData);
        _status.value = CreateUserLibraryStatus.submitted;
      }
    } else {
      if (_name.value.isEmpty ||
          _contact.value.isEmpty ||
          _userType.value == UserTypeEnum.unknown ||
          _course.value == CourseEnum.unknown ||
          _gender.value == GenderEnum.unknown) {
        Get.snackbar(
          'Warning!',
          "Please make sure all data is valid.",
          colorText: Colors.white,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.add_alert),
        );

        _status.value = CreateUserLibraryStatus.error;
      } else {
        MyLogger.printInfo("Proceed to save data");

        final userData = UserLibraryModel(
            uid: '',
            name: _name.value,
            contact: _contact.value,
            course: _course.value,
            gender: _gender.value,
            userType: _userType.value,
            answered: false,
            version: 0,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now());
        userLibraryData.value =
            await UserRepository.createUserLibraryToSurvey(userData);
        _status.value = CreateUserLibraryStatus.submitted;
      }
    }
  }
}
