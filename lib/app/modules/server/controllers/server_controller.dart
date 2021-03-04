import 'package:aiot/app/modules/server/services/db_service.dart';
import 'package:get/get.dart';

class ServerController extends GetxController {
  //TODO: Implement ServerController
  final DbService dbService;

  final count = 0.obs;

  ServerController({this.dbService});

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
