import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartController extends GetxController {
  static StartController get instance => Get.find();

  final _userType = ''.obs;
  final _service = ''.obs;
  final _name = ''.obs;
  final _address = ''.obs;
  final _contact = ''.obs;
  final isUserExpanded = false.obs;
  final isServiceExpanded = false.obs;

  final expandableController = ExpandableController().obs;
  final expandableController2 = ExpandableController().obs;
  final nameCtrl = TextEditingController();

  List<bool> checkedValueUserType = [false, false, false, false].obs;
  List<bool> checkedValueService =
      [false, false, false, false, false, false, false].obs;

  void updateSelectedUserType(String selectedType) {
    _userType.value = selectedType;
    update();
  }

  void setNameValue(String name) {
    _name.value = name;
  }

  void setAddressValue(String address) {
    _address.value = address;
  }

  void setContactValue(String contact) {
    _contact.value = contact;
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
    userType = userType;
  }

  void changeCheckService(int index) {
    checkedValueService[index] = false;
  }

  bool ifCurrentlySelectedService(int index) {
    if (checkedValueService[index] == true) {
      return true;
    }
    return false;
  }

  void updateSelectedService(int index, var value, String service) {
    checkedValueService[index] = value!;
    service = service;
  }

  void submitData() {
    print("Name: $_name");
    print("Address: $_address");
    print("Contact: $_contact");
    print("User Type: $_userType");
    print("Service: $_service");
  }
}
