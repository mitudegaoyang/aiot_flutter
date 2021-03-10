// import 'package:aiot/app/modules/dashboard/components/dataCardGrid/dataCardGrid.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:aiot/app/modules/dashboard/dashboard_model.dart';
// import 'package:aiot/config.dart';

class DashboardProvider extends GetConnect {
  final _box = GetStorage();
  final _key = 'accessToken';

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => DataStatistics.fromJson(map);

    // httpClient.defaultDecoder = (map) => TrendList.fromJson(map);
  }

  Future<Response<DataStatistics>> dataStatistics(data) async {
    String ip = _box.read('IP');
    return await get(
      'http://$ip/api/v1/dashboard/data/statistics',
      headers: {"Authorization": _box.read(_key)},
      decoder: (map) => DataStatistics.fromJson(map),
    );
  }

  Future<Response<List<dynamic>>> getDeviceTrend(String type) async {
    String ip = _box.read('IP');
    return await get(
      'http://$ip/api/v1/dashboard/device/trend?type=$type',
      headers: {"Authorization": _box.read(_key)},
      // decoder: (list) => TrendList.fromJson(list),
      decoder: (json) {
        if (json != null) {
          // 不使用箭头函数用法
          // json.sort(
          //   (left, right) {
          //     return left['xtime']
          //                 .toDouble()
          //                 .compareTo(right['xtime'].toDouble()) ==
          //             1
          //         ? 1
          //         : -1;
          //   },
          // );

          // 使用箭头函数用法
          json.sort((left, right) =>
              left['xtime'].toDouble().compareTo(right['xtime'].toDouble()) == 1
                  ? 1
                  : -1);
          List<Trend> tmpList = new List();
          (json as List).forEach((v) {
            tmpList.add(new Trend.fromJson(v));
          });
          return tmpList;
        }
      },
    );
  }

  Future<Response<List<DeviceTop>>> getDeviceTop() async {
    String ip = _box.read('IP');
    return await get(
      'http://$ip/api/v1/dashboard/device/top',
      headers: {"Authorization": _box.read(_key)},
      decoder: (json) {
        if (json != null) {
          List<DeviceTop> tmpList = new List();
          (json as List).forEach((v) {
            tmpList.add(new DeviceTop.fromJson(v));
          });
          return tmpList;
        }
      },
    );
  }

  Future<Response<DataStatisticsRatio>> getRatio() async {
    String ip = _box.read('IP');
    return await get(
      'http://$ip/api/v1/dashboard/device/ratio',
      headers: {"Authorization": _box.read(_key)},
      decoder: (map) => DataStatisticsRatio.fromJson(map),
    );
  }

  Future<Response<TelemetryTrend>> getTelemetryTrend() async {
    String ip = _box.read('IP');
    return await get(
      'http://$ip/api/v1/screen/telemetry/trend',
      headers: {"Authorization": _box.read(_key)},
      decoder: (map) => TelemetryTrend.fromJson(map),
    );
  }
}
