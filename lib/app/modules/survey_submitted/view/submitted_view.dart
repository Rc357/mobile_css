import 'package:css/app/helpers/image_path_helper.dart';
import 'package:css/app/modules/survey_submitted/controller/message_controller.dart';
import 'package:css/app/modules/survey_submitted/widgets/message_card.dart';

import 'package:css/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmittedView extends GetView<MessageController> {
  const SubmittedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Theme(
          data: ThemeData().copyWith(
            dividerColor: Colors.transparent,
          ),
          child: Scaffold(
            backgroundColor: const Color(0xffE3DCDC),
            persistentFooterButtons: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppPages.OFFICE_DASHBOARD);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder()),
                  child: const SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Back Home'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            body: SingleChildScrollView(
              child: Container(
                // color: Colors.white,
                color: const Color(0xfff0099cb),
                width: MediaQuery.of(context).size.width,
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
                            height: .15 * MediaQuery.of(context).size.height,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color(0xffE3DCDC),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      size: 50,
                                      color: Colors.green,
                                    ),
                                    const Text(
                                      'Survey Submitted!',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const MessageCardWidget(),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
