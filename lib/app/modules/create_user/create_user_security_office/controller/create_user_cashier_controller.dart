import 'package:css/app/enum/type_user_enum.dart';
import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/user_security_office_model.dart';
import 'package:css/app/modules/create_user/controller/course_and_year_controller.dart';
import 'package:css/app/repositories/user_repository.dart';
import 'package:css/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CreateUserSecurityOfficeStatus { initial, loading, submitted, error }

class CreateUserSecurityOfficeController extends GetxController {
  static CreateUserSecurityOfficeController get instance => Get.find();
  late Worker _statusEverWorker;

  final courseAndYearLevelController = CourseAndYearLevelController.instance;

  final _status = CreateUserSecurityOfficeStatus.initial.obs;

  final _name = ''.obs;
  final _address = ''.obs;
  final _userType = UserTypeEnum.unknown.obs;

  final isUserExpanded = false.obs;
  final isServiceExpanded = false.obs;
  final _userSecurityOfficeData = Rxn<UserSecurityOfficeModel>();

  bool get isLoading => _status.value == CreateUserSecurityOfficeStatus.loading;

  String currentState() =>
      'CreateUserRegistrarController(Name: ${_name.value}, Address: ${_address.value}, User Type: ${_userType.value},)';

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
          case CreateUserSecurityOfficeStatus.error:
            MyLogger.printError(currentState());
            break;
          case CreateUserSecurityOfficeStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case CreateUserSecurityOfficeStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case CreateUserSecurityOfficeStatus.submitted:
            MyLogger.printInfo(currentState());
            Get.offAndToNamed(AppPages.SURVEY_SECURITY_OFFICE,
                arguments: _userSecurityOfficeData.value);
            break;
        }
      },
    );
  }

  void setNameValue(String name) {
    _name.value = name;
    MyLogger.printInfo(currentState());
  }

  void setAddressValue(String address) {
    _address.value = address;
    MyLogger.printInfo(currentState());
  }

  void setUserTypeValue(UserTypeEnum userType) {
    _userType.value = userType;
    MyLogger.printInfo(currentState());
  }

  Future<void> proceedToSecurityOffice() async {
    _status.value = CreateUserSecurityOfficeStatus.loading;

    if (_name.value.isEmpty ||
        _address.value.isEmpty ||
        _userType.value == UserTypeEnum.unknown) {
      Get.snackbar(
        'Warning!',
        "Please make sure all data is valid.",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );

      _status.value = CreateUserSecurityOfficeStatus.error;
    } else {
      MyLogger.printInfo("Proceed to save data");

      final userData = UserSecurityOfficeModel(
          uid: '',
          name: _name.value,
          address: _address.value,
          userType: _userType.value,
          answered: false,
          version: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());

      _userSecurityOfficeData.value =
          await UserRepository.createUserSecurityOfficeToSurvey(userData);
      _status.value = CreateUserSecurityOfficeStatus.submitted;
    }
  }
}
