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
                image: AssetImage('assets/images/bg2.jpg'),
                fit: BoxFit.fitHeight)),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            const Text(
              'Office QR Scanner',
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
                  elevation: 20,
                  minimumSize: const Size(150, 100),
                  shadowColor: const Color(0xfff1044B4),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.qr_code_scanner_outlined),
                    Text(
                      'Scan Office QR Code',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
