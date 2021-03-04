class Server {
  String ip;
  String identity;
  String password;
  String lastConnection;

  Server({ip, identity, password, lastConnection});

  Server.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    identity = json['identity'];
    password = json['password'];
    lastConnection = json['lastConnection'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ip'] = ip;
    data['identity'] = identity;
    data['password'] = password;
    data['lastConnection'] = lastConnection;
    return data;
  }
}
