import 'package:aiot/app/modules/server/repositories/server.dart';
import 'package:aiot/app/modules/server/server_model.dart';
import 'package:get/get.dart';

class ServerController extends GetxController {
  final ServerRepository serverRepository;

  final count = 0.obs;
  final List servers = [].obs;

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

  Future<void> addServer(Server server) async {
    await serverRepository.insert(server);
    getAllServer();
  }

  Future<void> getAllServer() async {
    var _servers = await serverRepository.getAll();
    print("000");
    print(_servers);
    servers.assignAll(_servers);
  }

  Future<void> removeServer(Server server) async {
    await serverRepository.delete(server.id);
    getAllServer();
  }
}
