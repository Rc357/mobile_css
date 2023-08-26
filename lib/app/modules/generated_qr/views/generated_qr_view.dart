import 'package:css/app/helpers/image_path_helper.dart';
import 'package:css/app/modules/generated_qr/widgets/qr_widget.dart';
import 'package:css/app/modules/widgets/loading_overlay_widget.dart';
import 'package:css/app/modules/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../controllers/generated_qr_controller.dart';
import '../widgets/separator_line.dart';

class GeneratedQrView extends GetView<GeneratedQrController> {
  const GeneratedQrView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildLabelContent(
            {required String label, required String content}) =>
        Row(children: [
          Text(
            '$label: ',
            style: const TextStyle(fontSize: 16, color: Colors.black45),
          ),
          Text(
            content,
            style: const TextStyle(fontSize: 16, color: Colors.black45),
          ),
        ]);
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
                            height: .22 * MediaQuery.of(context).size.height,
                          ),
                        ),
                        Positioned.fill(
                          top: .1 * MediaQuery.of(context).size.height,
                          left: .11 * MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Thank You!',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  'Please proceed to ${controller.currentUserData.service} and show this qr code to scan.\n',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
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
                              color: Colors.grey,
                            ),
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImagePath.mobileWhiteLogo,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        'Bicol University Polangui \nPolangui, Albay',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  buildLabelContent(
                                      label: 'Name',
                                      content: controller.currentUserData.name),
                                  buildLabelContent(
                                      label: 'Date/Time',
                                      content: controller.dateAndTime.value),
                                  buildLabelContent(
                                      label: 'Type of User',
                                      content:
                                          controller.currentUserData.userType),
                                  buildLabelContent(
                                      label: 'Service Visited',
                                      content:
                                          controller.currentUserData.service),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const MySeparator(),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                '* Please save or take screen shot of the qr code below *',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black45),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Screenshot(
                                controller: controller.screenshotController,
                                child: QRWidget(
                                  data: controller.currentUserData.reference,
                                ),
                              ),
                              const Text(
                                'Reference ID:',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black45),
                              ),
                              Text(
                                controller.currentUserData.reference,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black45),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              RoundedButton(
                                onPressed: () {
                                  controller.captureSaveQR();
                                },
                                text: 'SAVE',
                                hasGradient: true,
                                textColor: Colors.white,
                                textSize: 16,
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
