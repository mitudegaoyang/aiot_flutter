import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:aiot/app/modules/dashboard/dashboard_model.dart';
import 'package:aiot/config.dart';

class DashboardProvider extends GetConnect {
  final _box = GetStorage();
  final _key = 'accessToken';

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => DataStatistics.fromJson(map);
    httpClient.baseUrl = CloudConfig.baseUrl;
  }

  Future<Response<DataStatistics>> dataStatistics(data) async => await get(
        '/dashboard/data/statistics',
        headers: {"Authorization": _box.read(_key)},
        decoder: (map) => DataStatistics.fromJson(map),
      );
}
