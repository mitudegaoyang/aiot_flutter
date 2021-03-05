import 'package:aiot/app/modules/server/server_model.dart';
import 'package:aiot/app/modules/server/tables/server.dart';
import 'package:aiot/db.dart';
import 'package:get/get.dart';

class ServerRepository extends GetxService {
  ServerRepository();

  Future<Server> insert(Server server) async {
    print('====');
    print(server.toJson());
    server.id = await GetDb.db.insert(ServerTable.tableName, server.toJson());
    return server;
  }

  Future<Server> update(Server server) async {
    server.id = await GetDb.db.update(ServerTable.tableName, server.toJson(),
        where: "id = ?", whereArgs: [server.id]);
    return server;
  }

  Future<int> delete(int id) async {
    return await GetDb.db
        .delete(ServerTable.tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Server>> getAll() async {
    print(GetDb.db);
    List<Map> rows = await GetDb.db.query(ServerTable.tableName);
    return [for (var row in rows) Server.fromJson(row)];
  }

  Future<Server> getById(int id) async {
    List<Map> rows = await GetDb.db.query(ServerTable.tableName,
        where: 'id = ?', whereArgs: [id], limit: 1);
    return Server.fromJson(rows.first);
  }

  // Future<Server> getLast() async {
  //   List<Map> rows = await GetDb.db.query(ServerTable.tableName, limit: 1);
  //   return Server.fromJson(rows.first);
  // }
}
