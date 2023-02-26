import 'package:css/modules/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * .3,
          ),
          Image.asset(
            'assets/logo.png',
            semanticLabel: 'Mobile CSS Logo',
            height: 200,
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: LoadingBouncingGrid.circle(
                backgroundColor: Colors.indigo.shade700,
                duration: const Duration(milliseconds: 1000)),
          )
        ],
      ),
    );
  }
}
