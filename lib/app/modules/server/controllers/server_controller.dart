import 'package:aiot/app/modules/server/providers/db_provider.dart';
import 'package:get/get.dart';

class ServerController extends GetxController {
  //TODO: Implement ServerController
  final DbProvider dbProvider;

  final count = 0.obs;

  ServerController({this.dbProvider});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
