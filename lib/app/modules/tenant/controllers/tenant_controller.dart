import 'package:aiot/app/modules/tenant/providers/tenant_provider.dart';
import 'package:get/get.dart';

import '../tenant_model.dart';

class TenantController extends GetxController {
  TenantController({this.tenantProvider, authProvider});

  final TenantProvider tenantProvider;

  final count = 0.obs;
  final tenantlist = TenantList().obs;
  @override
  void onInit() {
    super.onInit();
    //租户列表
    tenantProvider.getTenants().then((data) {
      print(data.body.data);
      tenantlist.value = data.body;
    }, onError: (err) {
      print(err);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
