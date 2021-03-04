import 'package:aiot/app/modules/server/server_model.dart';
import 'package:aiot/app/modules/server/services/db_service.dart';
import 'package:aiot/app/modules/server/tables/server.dart';
import 'package:get/get.dart';

class ServerRepository extends GetxService {
  final DbService dbService;

  ServerRepository(this.dbService);

  Future<Server> insert(Server server) async {
    server.id =
        await dbService.instance.insert(ServerTable.tableName, server.toJson());
    return server;
  }

  Future<Server> update(Server server) async {
    server.id = await dbService.instance.update(
        ServerTable.tableName, server.toJson(),
        where: "id = ?", whereArgs: [server.id]);
    return server;
  }

  Future<int> delete(int id) async {
    return await dbService.instance
        .delete(ServerTable.tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Server>> getAll(int trackerId) async {
    List<Map> rows = await dbService.instance.query(ServerTable.tableName);
    return [for (var row in rows) Server.fromJson(row)];
  }

  Future<Server> getById(int id) async {
    List<Map> rows = await dbService.instance.query(ServerTable.tableName,
        where: 'id = ?', whereArgs: [id], limit: 1);
    return Server.fromJson(rows.first);
  }

  // Future<Server> getLast() async {
  //   List<Map> rows = await dbService.instance.query(ServerTable.tableName, limit: 1);
  //   return Server.fromJson(rows.first);
  // }
}
