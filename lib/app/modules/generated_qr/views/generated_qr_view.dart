import 'package:css/app/helpers/image_path_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/generated_qr_controller.dart';

class GeneratedQrView extends GetView<GeneratedQrController> {
  const GeneratedQrView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset(
              ImagePath.torchWithCircle,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
