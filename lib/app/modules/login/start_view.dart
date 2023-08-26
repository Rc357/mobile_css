import 'package:css/app/modules/login/controller.dart';
import 'package:css/app/modules/login/widgets/text_field.dart';
import 'package:css/app/modules/widgets/loading_overlay_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'widgets/select_services.dart';
part 'widgets/type_of_user.dart';

class StartView extends GetView<StartController> {
  const StartView({super.key});
  @override
  Widget build(BuildContext context) {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: const Color(0xFFDCDCDC),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: data.size.shortestSide < 600
                                ? MediaQuery.of(context).size.height * .3
                                : MediaQuery.of(context).size.height * .5,
                            // width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/bg_building.png"),
                                  fit: BoxFit.fitWidth),
                            ),
                            // child: // Foreground widget here
                          ),
                          // const SizedBox(
                          //   height: 80,
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Welcome!',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text('Please fill up the log-in form.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    )),
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
                                // TextFieldInput(
                                //   onChanged: (String? value) {
                                //     controller.setAddressValue(value!);
                                //   },
                                //   hintText: 'Address',
                                //   label: 'Address',
                                // ),
                                NumberTextFieldInput(
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
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade900,
                                foregroundColor: Colors.white,
                                shape: const StadiumBorder()),
                            child: const SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Next'),
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
                    ],
                  ),
                ),
              ),
            ),
            _buildLoadingOverlay()
          ],
        ),
      ),
    );
  }

  Obx _buildLoadingOverlay() =>
      Obx(() => LoadingOverlay(isLoading: controller.isLoading));
}
