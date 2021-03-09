import 'package:aiot/app/modules/home/controllers/auth_controller.dart';
import 'package:aiot/app/modules/home/providers/auth_provider.dart';
import 'package:aiot/app/modules/server/repositories/server.dart';
import 'package:get/get.dart';

import '../controllers/server_controller.dart';

class ServerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<DbService>(DbService());
    // Get.put<DbService>(DbService());
    Get.lazyPut<ServerRepository>(
      () => ServerRepository(),
    );
    Get.lazyPut<ServerController>(
      () => ServerController(Get.find()),
    );
    Get.lazyPut<AuthProvider>(() => AuthProvider());

    Get.lazyPut<AuthController>(
      () => AuthController(authProvider: Get.find()),
    );
  }
}
