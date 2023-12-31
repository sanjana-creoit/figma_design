import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HomePage.dart';
import 'HomePageController.dart';
import 'Model/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().db;
  runApp(
    GetMaterialApp(
      home: Builder(
        builder: (context) {
          Get.put(() => HomePageController());
          return HomePage();
        },
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
