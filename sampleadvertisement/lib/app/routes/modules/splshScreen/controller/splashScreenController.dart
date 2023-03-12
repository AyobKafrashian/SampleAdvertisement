import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../home/view/Home_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Timer(Duration(seconds: 3), () {
      Get.off(HomeScreen());
    });
  }
}
