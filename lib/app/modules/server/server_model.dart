class Server {
  int id;
  String ip;
  String identity;
  String password;
  String lastConnection;

  Server({id, ip, identity, password, lastConnection});

  Server.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ip = json['ip'];
    identity = json['identity'];
    password = json['password'];
    lastConnection = json['lastConnection'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['ip'] = ip;
    data['identity'] = identity;
    data['password'] = password;
    data['lastConnection'] = lastConnection;
    return data;
  }
}
