import 'package:css/app/helpers/image_path_helper.dart';
import 'package:css/app/modules/create_user/create_user_admin_office/controller/create_user_admin_office_controller.dart';
import 'package:css/app/modules/create_user/widgets/course_dropdown_widget.dart';
import 'package:css/app/modules/create_user/widgets/text_field.dart';
import 'package:css/app/modules/create_user/widgets/user_type_dropdown_widget.dart';
import 'package:css/app/modules/create_user/widgets/year_level_dropdown_widget.dart';
import 'package:css/app/modules/widgets/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreateUserAdminOffice extends GetView<CreateUserAdminOfficeController> {
  const CreateUserAdminOffice({super.key});
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
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SvgPicture.asset(
                              ImagePath.torchWithCircle,
                              height: .2 * MediaQuery.of(context).size.height,
                            ),
                          ),
                          Positioned.fill(
                            top: .1 * MediaQuery.of(context).size.height,
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
                                    'Please fill up the log-in form.',
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
                            border: Border.all(
                              color: const Color(0xffE3DCDC),
                            ),
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
                                  TextFieldInput(
                                    onChanged: (String? value) {
                                      controller.setNameValue(value!);
                                    },
                                    hintText: 'Juan dela Cruz',
                                    label: 'Name',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CourseDropdown(
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      controller.courseAndYearLevelController
                                          .setSelectedCourse(value);
                                      controller.setCourseValue(value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  YearLevelDropdown(
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      controller.setYearLevelValue(value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  UserTypeDropdown(
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      controller.setUserTypeValue(value);
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
                                controller.proceedToAdminOffice();
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
