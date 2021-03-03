import 'package:get/get.dart';

import 'package:aiot/app/modules/home/controllers/auth_controller.dart';
import 'package:aiot/app/modules/home/providers/auth_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());

    Get.lazyPut<AuthController>(
      () => AuthController(authProvider: Get.find()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
