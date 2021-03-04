import 'package:aiot/app/modules/server/tables/server.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService extends GetxService {
  Database _db;

  Database get instance => _db;

  @override
  void onInit() async {
    print('-----onInit DbService');
    super.onInit();
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'aiot.db');
    print(path);
    Future onConfigure(Database db) async {
      await db.execute('PRAGMA foreign_keys = ON');
    }

    _db = await openDatabase(
      path,
      version: 1,
      onConfigure: onConfigure,
      onCreate: (Database db, int version) async {
        print('onCreate');
        print(db);
        print(version);
        var batch = db.batch();
        batch.execute(ServerTable.createQuery);
        await batch.commit();
      },
    );
  }

  @override
  Future<void> onClose() async {
    await _db.close();
  }
}
