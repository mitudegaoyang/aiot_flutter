import 'dart:async';

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
  final List telemetryTrendList = [].obs;
  final telemetryTotal = 0.obs;
  final List actionTrendList = [].obs;
  final actionTotal = 0.obs;
  final List deviceTop = [].obs;
  final count = 0.obs;
  bool showDialog = false;
  Timer timer;

  @override
  void onInit() {
    super.onInit();
    dashboardProvider.dataStatistics({}).then((data) {
      dataStatistics.value = data.body;
    });
    dashboardProvider.getDeviceTrend('0').then((data) {
      trendList.assignAll(data.body);
    });
    dashboardProvider.getDeviceTrend('1').then((data) {
      trendListYear.assignAll(data.body);
    });
    dashboardProvider.getTelemetryTrend().then((data) {
      telemetryTrendList.assignAll(data.body.histories);
      telemetryTotal.value = data.body.total;
    });
    dashboardProvider.getActionTrend().then((data) {
      actionTrendList.assignAll(data.body.histories);
      actionTotal.value = data.body.total;
    });

    dashboardProvider.getDeviceTop().then((data) {
      deviceTop.assignAll(data.body);
    });
  }

  @override
  void onReady() {
    super.onReady();
    timers();
  }

  @override
  void onClose() {
    timer.cancel();
  }

  void increment() => count.value++;

  void timers() {
    timer = Timer(Duration(seconds: 10), () {
      dashboardProvider.getTelemetryTrend().then((data) {
        telemetryTrendList.assignAll(data.body.histories);
        telemetryTotal.value = data.body.total;
      }).onError((error, stackTrace) {
        showDialog = true;
        timer.cancel();
      });
      dashboardProvider.getActionTrend().then((data) {
        actionTrendList.assignAll(data.body.histories);
        actionTotal.value = data.body.total;
      }).onError((error, stackTrace) {
        showDialog = true;
        timer.cancel();
      });
      timers();
    });
  }
}
