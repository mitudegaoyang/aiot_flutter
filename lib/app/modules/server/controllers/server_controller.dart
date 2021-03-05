import 'package:aiot/app/modules/server/repositories/server.dart';
import 'package:aiot/app/modules/server/server_model.dart';
import 'package:get/get.dart';

class ServerController extends GetxController {
  final ServerRepository serverRepository;

  final count = 0.obs;
  final servers = [].obs;

  ServerController(this.serverRepository);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getAllServer();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  Future<void> addServer() async {
    var s = await serverRepository.insert(Server.fromJson({
      "ip": "103.93.180.122:8082",
      "identity": "admin",
      "password": "123456"
    }));
    print(s);
  }

  Future<void> getAllServer() async {
    var _servers = await serverRepository.getAll();
    print("000");
    print(_servers);
    servers.assignAll(_servers);
  }
}
