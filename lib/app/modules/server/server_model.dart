class Server {
  int id;
  String ip;
  String alias;
  String identity;
  String password;
  String lastConnection;

  Server({id, ip, alias, identity, password, lastConnection});

  Server.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ip = json['ip'];
    alias = json['alias'];
    identity = json['identity'];
    password = json['password'];
    lastConnection = json['lastConnection'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['ip'] = ip;
    data['alias'] = alias;
    data['identity'] = identity;
    data['password'] = password;
    data['lastConnection'] = lastConnection;
    return data;
  }
}
