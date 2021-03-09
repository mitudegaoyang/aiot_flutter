import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

import 'package:aiot/app/modules/dashboard/providers/dashboard_provider.dart';

import 'package:aiot/app/modules/dashboard/dashboard_model.dart';
// import 'package:aiot/app/modules/dashboard/trend_model.dart';

class DashboardController extends GetxController {
  DashboardController({this.dashboardProvider});

  final DashboardProvider dashboardProvider;
  final dataStatistics = DataStatistics().obs;
  final List trendList = [].obs;
  final List trendListYear = [].obs;
  final List deviceTop = [].obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    dashboardProvider.dataStatistics({}).then((data) {
      dataStatistics.value = data.body;
    });
    dashboardProvider.getDeviceTrend('0').then((data) {
      trendList.assignAll(data.body.data);
    });
    dashboardProvider.getDeviceTrend('1').then((data) {
      trendListYear.assignAll(data.body.data);
    });

    dashboardProvider.getDeviceTop().then((data) {
      deviceTop.assignAll(data.body);
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
