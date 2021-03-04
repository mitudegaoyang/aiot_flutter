import 'package:aiot/app/modules/server/services/db_service.dart';
import 'package:get/get.dart';

import '../controllers/server_controller.dart';

class ServerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DbService>(
      () => DbService(),
    );

    Get.lazyPut<ServerController>(
      () => ServerController(dbService: Get.find()),
    );
  }
}
