import 'package:get/get.dart';
import 'package:sampleadvertisement/app/routes/modules/splshScreen/controller/splashScreenController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
      () => SplashScreenController(),
    );
  }
}
