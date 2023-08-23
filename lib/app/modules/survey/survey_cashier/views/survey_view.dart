import 'package:css/app/helpers/image_path_helper.dart';
import 'package:css/app/modules/survey/survey_cashier/controller/survey_controller.dart';
import 'package:css/app/modules/survey/widgets/text_field.dart';
import 'package:css/app/modules/survey/widgets/dropdown_field.dart';
import 'package:css/app/modules/widgets/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SurveyCashierOfficeView extends StatelessWidget {
  SurveyCashierOfficeView({super.key});
  final surveyController = SurveyCashierOfficeController.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => surveyController.isLoading,
      child: Stack(
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
                        Positioned(
                          top: .12 * MediaQuery.of(context).size.height,
                          left: .12 * MediaQuery.of(context).size.height,
                          child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "You will now be evaluating \nthe Cashier Office.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Office personnel report for work on time and are available during office hours.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SurveySizeDropdown(
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      surveyController.setQuestion1Value(value);
                                    },
                                    name: 'reg1',
                                    number: 1,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Upholds the sanctity and confidentially of files or records.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SurveySizeDropdown(
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      surveyController.setQuestion2Value(value);
                                    },
                                    name: 'reg2',
                                    number: 2,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'With organized record keeping clean and conducive workplace.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SurveySizeDropdown(
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      surveyController.setQuestion3Value(value);
                                    },
                                    name: 'reg3',
                                    number: 3,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Provides comfortable waiting area.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SurveySizeDropdown(
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      surveyController.setQuestion4Value(value);
                                    },
                                    name: 'reg4',
                                    number: 4,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Remarks/Suggestions',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextFormField(
                                    name: 'optional',
                                    label: 'Optional'.tr,
                                    onChanged: (value) => surveyController
                                        .setOptionalValue(value!),
                                    textCapitalization:
                                        TextCapitalization.words,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        surveyController.submitData();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          shape: const StadiumBorder()),
                                      child: SizedBox(
                                        width: 200,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('Submit'),
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
          _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Obx _buildLoadingOverlay() =>
      Obx(() => LoadingOverlay(isLoading: surveyController.isLoading));
}
