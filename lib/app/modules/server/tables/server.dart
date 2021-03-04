class ServerTable {
  static const String createQuery = '''
  DROP TABLE IF EXISTS "server";
  CREATE TABLE "server" (
      "id"	INTEGER,
      "ip"	TEXT,
      "identity"	TEXT,
      "password"	TEXT,
      "lastConnection"	NUMERIC,
      PRIMARY KEY("id" AUTOINCREMENT)
    );
  ''';
}
