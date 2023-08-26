import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/user_model.dart';
import 'package:css/app/modules/survey/survey_admin_office/controller/survey_controller.dart';
import 'package:css/app/modules/survey/survey_cashier/controller/survey_controller.dart';
import 'package:css/app/modules/survey/survey_library/controller/survey_controller.dart';
import 'package:css/app/modules/survey/survey_registrar/controller/survey_controller.dart';
import 'package:css/app/modules/survey/survey_security_office/controller/survey_controller.dart';
import 'package:css/app/repositories/user_repository.dart';
import 'package:css/app/routes/app_pages.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UserStartStatus { initial, loading, submitted, error }

class StartController extends GetxController {
  static StartController get instance => Get.find();
  late Worker _statusEverWorker;

  final surveyLibraryController = SurveyLibraryController.instance;
  final surveyAdminOfficeController = SurveyAdminOfficeController.instance;
  final surveySecurityOfficeController =
      SurveySecurityOfficeController.instance;
  final surveyRegistrarOfficeController =
      SurveyRegistrarOfficeController.instance;
  final surveyCashierOfficeController = SurveyCashierOfficeController.instance;
  final _status = UserStartStatus.initial.obs;

  final userTypeSelected = ''.obs;
  final serviceSelected = ''.obs;
  final _name = ''.obs;
  final _address = ''.obs;
  final _contact = ''.obs;
  final isUserExpanded = false.obs;
  final isServiceExpanded = false.obs;

  final userId = ''.obs;
  final currentUserData = Rxn<UserModel>();

  final expandableController = ExpandableController().obs;
  final expandableController2 = ExpandableController().obs;
  final nameCtrl = TextEditingController();

  List<bool> checkedValueUserType = [false, false, false, false].obs;
  List<bool> checkedValueService = [false, false, false, false, false].obs;

  bool get isLoading => _status.value == UserStartStatus.loading;

  String currentState() =>
      'StartController(Name: ${_name.value}, Contact: ${_contact.value}, User Type: ${userTypeSelected.value}, Service: ${serviceSelected.value}})';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorStartFormStatus();
  }

  void resetUserData() {
    userTypeSelected.value = '';
    serviceSelected.value = '';
    _name.value = '';
    _contact.value = '';
    isUserExpanded.value = false;
    checkedValueUserType = [false, false, false, false].obs;
    checkedValueService = [false, false, false, false, false].obs;
  }

  void _monitorStartFormStatus() {
    _statusEverWorker = ever(
      _status,
      (value) async {
        switch (value) {
          case UserStartStatus.error:
            MyLogger.printError(currentState());
            break;
          case UserStartStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case UserStartStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case UserStartStatus.submitted:
            MyLogger.printInfo(currentState());

            Get.toNamed(AppPages.GENERATED_QR,
                arguments: currentUserData.value);

            // if (serviceSelected.value == 'Library') {
            //   surveyLibraryController.userId.value = userId.value;
            //   Get.toNamed(AppPages.SURVEY_LIBRARY);
            // } else if (serviceSelected.value == 'Admin Office') {
            //   surveyAdminOfficeController.userId.value =
            //       '${_contact.value}_Admin_Office';
            //   Get.toNamed(AppPages.SURVEY_ADMIN_OFFICE);
            // } else if (serviceSelected.value == 'Security Office') {
            //   surveySecurityOfficeController.userId.value =
            //       '${_contact.value}_Security_Office';
            //   Get.toNamed(AppPages.SURVEY_SECURITY_OFFICE);
            // } else if (serviceSelected.value == 'Registrar') {
            //   surveyRegistrarOfficeController.userId.value = userId.value;
            //   Get.toNamed(AppPages.SURVEY_REGISTRAR_OFFICE);
            // } else if (serviceSelected.value == 'Cashier') {
            //   surveyCashierOfficeController.userId.value = userId.value;
            //   Get.toNamed(AppPages.SURVEY_CASHIER);
            // }
            break;
        }
      },
    );
  }

  // void updateSelectedUserType(String selectedType) {
  //   userTypeSelected.value = selectedType;
  //   update();

  //   MyLogger.printInfo(currentState());
  // }

  void setNameValue(String name) {
    _name.value = name;
    MyLogger.printInfo(currentState());
  }

  void setAddressValue(String address) {
    _address.value = address;
    MyLogger.printInfo(currentState());
  }

  void setContactValue(String contact) {
    _contact.value = contact;
    MyLogger.printInfo(currentState());
  }

  void changeExpandableStatus() {
    expandableController.value.expanded = !expandableController.value.expanded;
    isUserExpanded.value = !isUserExpanded.value;
  }

  void changeExpandableStatus2() {
    expandableController2.value.expanded =
        !expandableController2.value.expanded;
    isServiceExpanded.value = !isServiceExpanded.value;
  }

  void changeCheckUserType(int index) {
    checkedValueUserType[index] = false;
  }

  bool ifCurrentlySelected(int index) {
    if (checkedValueUserType[index] == true) {
      return true;
    }
    return false;
  }

  void updateSelectedUser(int index, var value, String userType) {
    checkedValueUserType[index] = value!;
    userTypeSelected.value = userType;
    MyLogger.printInfo(currentState());
  }

  void changeCheckService(int index) {
    checkedValueService[index] = false;
    MyLogger.printInfo(currentState());
  }

  bool ifCurrentlySelectedService(int index) {
    if (checkedValueService[index] == true) {
      return true;
    }
    return false;
  }

  void updateSelectedService(int index, var value, String service) {
    checkedValueService[index] = value!;
    serviceSelected.value = service;
    MyLogger.printInfo(currentState());
  }

  Future<void> submitData() async {
    _status.value = UserStartStatus.loading;
    if (_name.value.isEmpty ||
        _contact.value.isEmpty ||
        userTypeSelected.value.isEmpty ||
        serviceSelected.value.isEmpty) {
      Get.snackbar(
        'Warning!',
        "Please make sure all data is valid.",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );

      _status.value = UserStartStatus.error;
    } else {
      userId.value =
          '${_name.value.removeAllWhitespace}_${_contact.value}_${serviceSelected.value.removeAllWhitespace}';
      final surveyExist = await UserRepository.getSurvey(userId.value);

      final userData = UserModel(
          uid: userId.value,
          contact: _contact.value,
          reference: '',
          name: _name.value,
          userType: userTypeSelected.value,
          answered: false,
          service: serviceSelected.value,
          createdAt:
              surveyExist == null ? DateTime.now() : surveyExist.createdAt,
          updatedAt: DateTime.now());
      currentUserData.value = await UserRepository.createUserToSurvey(userData);
      _status.value = UserStartStatus.submitted;
    }
  }
}
