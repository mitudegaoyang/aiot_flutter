class Auth {
  String accessToken;
  int expiresIn;
  int loginFirst;
  String userType;
  List<Permissions> permissions;

  Auth({accessToken, expiresIn, loginFirst, userType, permissions});

  Auth.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiresIn = json['expiresIn'];
    loginFirst = json['loginFirst'];
    userType = json['userType'];
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions.add(Permissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['expiresIn'] = expiresIn;
    data['loginFirst'] = loginFirst;
    data['userType'] = userType;
    if (permissions != null) {
      data['permissions'] = permissions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Permissions {
  String id;
  String code;
  String name;
  String type;
  int menuOrder;
  List<Permissions> permissions;

  Permissions({id, code, name, type, menuOrder, permissions});

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    type = json['type'];
    menuOrder = json['menuOrder'];
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions.add(Permissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['type'] = type;
    data['menuOrder'] = menuOrder;
    if (permissions != null) {
      data['permissions'] = permissions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
