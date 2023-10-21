import 'package:css/app/enum/type_user_enum.dart';
import 'package:css/app/helpers/image_path_helper.dart';
import 'package:css/app/modules/create_user/create_user_library/controller/create_user_library_controller.dart';
import 'package:css/app/modules/create_user/widgets/course_dropdown_widget.dart';
import 'package:css/app/modules/create_user/widgets/gender_dropdown_widget.dart';
import 'package:css/app/modules/create_user/widgets/text_field.dart';
import 'package:css/app/modules/create_user/widgets/user_type_dropdown_widget.dart';
import 'package:css/app/modules/widgets/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserLibrary extends GetView<CreateUserLibraryController> {
  const CreateUserLibrary({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: const Color(0xfff1044B4),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 22,
                      ),
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              ImagePath.torch3d,
                              height: .18 * MediaQuery.of(context).size.height,
                            ),
                          ),
                          Positioned.fill(
                            top: .08 * MediaQuery.of(context).size.height,
                            left: .11 * MediaQuery.of(context).size.height,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome!',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Text(
                                    'Please fill in the log-in form.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  UserTypeDropdown(
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      controller.courseAndYearLevelController
                                          .setCourseIfNotStudent(value);
                                      controller.setUserTypeValue(value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFieldInput(
                                    onChanged: (String? value) {
                                      controller.setNameValue(value!);
                                    },
                                    hintText: 'Juan dela Cruz',
                                    label: 'Name (Optional)',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  if (controller.userType ==
                                          UserTypeEnum.student ||
                                      controller.userType ==
                                          UserTypeEnum.alumni)
                                    CourseDropdown(
                                      onChanged: (value) {
                                        if (value == null) {
                                          return;
                                        }
                                        controller.setCourseValue(value);
                                      },
                                    ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  if (controller.userType ==
                                      UserTypeEnum.alumni)
                                    Column(
                                      children: [
                                        StudentIDNumberTextFieldInput(
                                          onChanged: (String? value) {
                                            controller.setStudentId(value!);
                                          },
                                          hintText: '20XXXXXXXXXXXXX',
                                          label: 'ID Number',
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  NumberTextFieldInput(
                                    onChanged: (String? value) {
                                      controller.setContactValue(value!);
                                    },
                                    hintText: '09XX XXX XXXX',
                                    label: 'Contact no.',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GenderDropdown(
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      controller.setGenderValue(value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.proceedToLibrary();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade900,
                                  foregroundColor: Colors.white,
                                  shape: const StadiumBorder()),
                              child: const SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Next'),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 150,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildLoadingOverlay()
          ],
        ),
      ),
    );
  }

  Obx _buildLoadingOverlay() =>
      Obx(() => LoadingOverlay(isLoading: controller.isLoading));
}
