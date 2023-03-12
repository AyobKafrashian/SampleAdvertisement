import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/modules/splshScreen/controller/splashScreenController.dart';
import 'app/routes/modules/splshScreen/view/splashScreen.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(SplashScreenController());
      }),
    ),
  );
}
