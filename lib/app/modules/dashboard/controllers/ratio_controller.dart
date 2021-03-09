import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

import 'package:aiot/app/modules/dashboard/providers/dashboard_provider.dart';

import 'package:aiot/app/modules/dashboard/dashboard_model.dart';

class RatioController extends GetxController {
  RatioController({this.ratioProvider});

  final DashboardProvider ratioProvider;
  final dataStatisticsRatio = DataStatisticsRatio().obs;

  @override
  void onInit() {
    super.onInit();
    ratioProvider.getRatio().then((data) {
      dataStatisticsRatio.value = data.body;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
