import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:css/modules/start/controller.dart';
import 'package:css/modules/start/student/start_student_view.dart';
import 'package:css/routes/app_pages.dart';

class StartView extends GetView<StartController> {
  const StartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_start.png'),
                fit: BoxFit.fill)),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Select Type of User",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Column(
                  children: [
                    RadioListTile(
                      title: const Text("Student"),
                      value: "male",
                      groupValue: controller.userType,
                      onChanged: (value) {
                        controller.updateSelectedUserType(value.toString());
                      },
                    ),
                    RadioListTile(
                      title: const Text("Guest"),
                      value: "guest",
                      groupValue: controller.userType,
                      onChanged: (value) {
                        controller.updateSelectedUserType(value.toString());
                      },
                    ),
                    RadioListTile(
                      title: const Text("Staff"),
                      value: "staff",
                      groupValue: controller.userType,
                      onChanged: (value) {
                        controller.updateSelectedUserType(value.toString());
                      },
                    ),
                    RadioListTile(
                      title: const Text("Admin"),
                      value: "admin",
                      groupValue: controller.userType,
                      onChanged: (value) {
                        controller.updateSelectedUserType(value.toString());
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppPages.START_STUDENT);
                },
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('NEXT'),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
