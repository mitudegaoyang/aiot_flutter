import 'package:aiot/app/modules/tenant/providers/tenant_provider.dart';
import 'package:get/get.dart';

import '../controllers/tenant_controller.dart';

class TenantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TenantProvider>(() => TenantProvider());

    Get.lazyPut<TenantController>(
      () => TenantController(tenantProvider: Get.find()),
    );
  }
}
