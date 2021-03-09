import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

import 'package:aiot/app/modules/dashboard/providers/dashboard_provider.dart';

import 'package:aiot/app/modules/dashboard/dashboard_model.dart';
import 'package:aiot/app/modules/dashboard/trend_model.dart';

class DashboardController extends GetxController {
  DashboardController({this.dashboardProvider});

  final DashboardProvider dashboardProvider;
  final dataStatistics = DataStatistics().obs;
  // final trendList = DataStatistics().obs;
  final trendList = TrendList().obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    dashboardProvider.dataStatistics({}).then((data) {
      dataStatistics.value = data.body;
    });
    dashboardProvider.getDeviceTrend('0').then((data) {
      trendList.value.data = data.body.data;
      // print('=====');
      print(data.body.data[0].toString());
      // print(trendList.value.data);
      // trendList.value = data.body.data.toList();
      // trendList.value = {'data': data};
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
