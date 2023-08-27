import 'package:css/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficeDashboardView extends StatelessWidget {
  const OfficeDashboardView({super.key});

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
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            const Text(
              'Office Scanner',
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .3,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppPages.QR_SCANNER_LOGIN);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: const Size(150, 50),
                ),
                child: const Text('Scan Visitor QR Code'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
