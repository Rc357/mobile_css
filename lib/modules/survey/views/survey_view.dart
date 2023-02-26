import 'package:css/constants/app_colors.dart';
import 'package:css/modules/start/start_view.dart';
import 'package:css/modules/survey/conroller/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyView extends StatelessWidget {
  SurveyView({super.key});
  final homeController = SurveyController.instance;

  static final views = [
    SurveyView(),
    const StartView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_home.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/back_icon.png',
                        semanticLabel: 'back icon',
                        height: 50,
                      ),
                      Image.asset(
                        'assets/icons/more_icon.png',
                        semanticLabel: 'more icon',
                        height: 50,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(''),
                      Card(
                        elevation: 0,
                        shadowColor: Colors.blue.shade200,
                        color: const Color(0X0FF3f7dbf),
                        shape: const StadiumBorder(
                          side: BorderSide(
                            color: AppColors.blue,
                            width: 0,
                          ),
                        ),
                        child: Container(
                          width: 120,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text(
                            'Survey Form',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            Container(
              // color: Colors.red,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white70,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.white70])),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  const SizedBox(
                    height: 0.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Other BUPC Building",
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
