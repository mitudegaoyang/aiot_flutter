import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

import 'package:aiot/app/modules/dashboard/providers/dashboard_provider.dart';

import 'package:aiot/app/modules/dashboard/dashboard_model.dart';

class DashboardController extends GetxController {
  DashboardController({this.dashboardProvider});

  final DashboardProvider dashboardProvider;
  final dataStatistics = DataStatistics().obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    dashboardProvider.dataStatistics({}).then((data) {
      dataStatistics.value = data.body;
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
