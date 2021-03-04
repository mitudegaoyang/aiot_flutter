import 'package:aiot/app/modules/server/server_model.dart';
import 'package:aiot/app/modules/server/services/db_service.dart';
import 'package:get/get.dart';

class ServerRepository extends GetxService {
  final DbService dbService;

  ServerRepository(this.dbService);

  Future<Server> insert(Server server) async {
    server.id = await dbService.instance.insert("server", server.toJson());
    return server;
  }

  Future<int> delete(int id) async {
    return await dbService.instance
        .delete("server", where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Server>> getAll(int trackerId) async {
    List<Map> rows = await dbService.instance.query("server");
    return [for (var row in rows) Server.fromJson(row)];
  }

  Future<Server> getLast() async {
    List<Map> rows = await dbService.instance.query("server", limit: 1);
    return Server.fromJson(rows.first);
  }
}
