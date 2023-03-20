import 'package:css/modules/start/widgets/text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:css/modules/start/controller.dart';
import 'package:css/routes/app_pages.dart';

part 'widgets/select_services.dart';
part 'widgets/type_of_user.dart';

class StartView extends GetView<StartController> {
  const StartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                    color: Color(0XFFd3d3d3)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            onChanged: (String? value) {
                              controller.setNameValue(value!);
                            },
                            hintText: 'John Doe',
                            label: 'Name',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            onChanged: (String? value) {
                              controller.setAddressValue(value!);
                            },
                            hintText: 'Address',
                            label: 'Address',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            onChanged: (String? value) {
                              controller.setContactValue(value!);
                            },
                            hintText: '09XX XXX XXXX',
                            label: 'Contact no.',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TypeOfUser(),
                          const SizedBox(
                            height: 20,
                          ),
                          SelectServices(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.submitData();
                        Get.toNamed(AppPages.START_STUDENT);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      child: SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Submit'),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
