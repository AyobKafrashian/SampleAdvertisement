import 'package:get/get.dart';

import 'modules/home/binding/Home_binding.dart';
import 'modules/home/view/Home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
