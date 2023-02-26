import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:css/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile CSS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo.shade800),
        useMaterial3: true,
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.HOME,
    );
  }
}
