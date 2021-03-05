import 'package:aiot/config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../tenant_model.dart';

class TenantProvider extends GetConnect {
  final _box = GetStorage();
  final _key = 'accessToken';

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Tenant.fromJson(map);
    httpClient.baseUrl = CloudConfig.baseUrl;
  }

  // Future<Response<Tenant>> getTenant(String id) async =>
  //     await get('tenant/$id');

  Future<Response<Tenant>> getTenant(String id) async =>
      await get('/tenant/$id',
          headers: {"Authorization": _box.read(_key)},
          decoder: (map) => Tenant.fromJson(map));

  Future<Response<Tenant>> postTenant(Tenant tenant) async =>
      await post('tenant', tenant);
  Future<Response> deleteTenant(int id) async => await delete('tenant/$id');

  Future<Response<TenantList>> getTenants(pageIndex) async =>
      await get('/tenants?pageIndex=$pageIndex&pageSize=8',
          headers: {"Authorization": _box.read(_key)},
          decoder: (map) => TenantList.fromJson(map));
}
