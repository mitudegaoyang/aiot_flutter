import 'package:aiot/app/modules/server/tables/server.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GetDb {
  static Database db;
  static Future<void> init() async {
    return new Future(() async {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'aiot.db');
      db = await openDatabase(
        path,
        version: 2,
        // onConfigure: onConfigure,
        onCreate: (Database db, int version) async {
          print('onCreate');
          print(db);
          print(version);
          var batch = db.batch();
          batch.execute(ServerTable.createQuery);
          await batch.commit();
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          var batch = db.batch();
          if (oldVersion <= 1) {
            batch.execute(ServerTable.addAliasColumnQuery);
          }
          await batch.commit();
        },
      );
    });
  }
}
