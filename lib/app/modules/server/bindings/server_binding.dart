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
  }
}
