import 'package:aiot/app/modules/server/providers/db_provider.dart';
import 'package:get/get.dart';

import '../controllers/server_controller.dart';

class ServerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DbProvider>(
      () => DbProvider(),
    );

    Get.lazyPut<ServerController>(
      () => ServerController(dbProvider: Get.find()),
    );
  }
}
