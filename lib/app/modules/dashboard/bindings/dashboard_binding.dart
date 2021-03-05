import 'package:aiot/app/modules/dashboard/providers/dashboard_provider.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(
      () => DashboardController(dashboardProvider: Get.find()),
    );
  }
}
