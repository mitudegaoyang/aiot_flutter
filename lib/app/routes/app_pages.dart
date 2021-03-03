import 'package:get/get.dart';

import 'package:aiot/app/modules/home/bindings/home_binding.dart';
import 'package:aiot/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
