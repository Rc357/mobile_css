import 'package:css/app/helpers/image_path_helper.dart';
import 'package:css/app/modules/survey/survey_cashier/controller/survey_controller.dart';
import 'package:css/app/modules/survey/widgets/text_field.dart';
import 'package:css/app/modules/survey/widgets/dropdown_field.dart';
import 'package:css/app/modules/widgets/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SurveyCashierOfficeView extends GetView<SurveyCashierOfficeController> {
  SurveyCashierOfficeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.isLoading,
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
                                  Obx(
                                    () => controller.cashierQuestions.isEmpty
                                        ? const Center(
                                            child: Padding(
                                            padding: EdgeInsets.all(25.0),
                                            child: Text('No QUESTIONS Yet'),
                                          ))
                                        : ListView.separated(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            primary: false,
                                            shrinkWrap: true,
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(height: 10),
                                            itemCount: controller
                                                .cashierQuestions.length,
                                            itemBuilder: (context, index) {
                                              final question = controller
                                                  .cashierQuestions[index];
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    question.question,
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  if (question.type ==
                                                      'Two Points Case')
                                                    Column(
                                                      children: [
                                                        TwoPointsSurveyDropdown(
                                                          onChanged: (value) {
                                                            if (value == null) {
                                                              return;
                                                            }
                                                            controller
                                                                .addLibraryAnswerTwoCase(
                                                                    question,
                                                                    value);
                                                          },
                                                          name: 'libQ$index',
                                                          number: index + 1,
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                      ],
                                                    ),
                                                  if (question.type ==
                                                      'Five Points Case')
                                                    Column(
                                                      children: [
                                                        FivePointsSurveyDropdown(
                                                          onChanged: (value) {
                                                            if (value == null) {
                                                              return;
                                                            }
                                                            controller
                                                                .addLibraryAnswerFiveCase(
                                                                    question,
                                                                    value);
                                                          },
                                                          name: 'libQ$index',
                                                          number: index + 1,
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                      ],
                                                    )
                                                ],
                                              );
                                            },
                                          ),
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
                                    onChanged: (value) =>
                                        controller.setOptionalValue(value!),
                                    textCapitalization:
                                        TextCapitalization.words,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.submitData();
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
      Obx(() => LoadingOverlay(isLoading: controller.isLoading));
}
