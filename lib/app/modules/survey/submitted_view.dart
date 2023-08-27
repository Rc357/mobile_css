import 'package:css/app/helpers/image_path_helper.dart';

import 'package:css/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SubmittedView extends StatelessWidget {
  const SubmittedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            color: const Color(0xfff0099cb),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
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
                    ],
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          color: const Color(0xffE3DCDC),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 20),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.check_circle,
                                  size: 40,
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
                                const Text(
                                  'Thank You! You have successfully submitted your feedback.',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height:
                                      .4 * MediaQuery.of(context).size.height,
                                ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Back Home'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
