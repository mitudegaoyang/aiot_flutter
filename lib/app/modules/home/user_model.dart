class User {
  String id;
  String name;
  Null tenantId;
  String identity;
  String roleId;
  String roleName;
  Null organizationId;
  Null organizationName;
  String userType;
  Null phone;
  int enable;
  int editable;
  String loginIp;
  Null loginAddress;
  int loginAt;
  int loginFirst;
  int createdAt;
  int updatedAt;
  List<PermissionList> permissionList;

  User(
      {id,
      name,
      tenantId,
      identity,
      roleId,
      roleName,
      organizationId,
      organizationName,
      userType,
      phone,
      enable,
      editable,
      loginIp,
      loginAddress,
      loginAt,
      loginFirst,
      createdAt,
      updatedAt,
      permissionList});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tenantId = json['tenantId'];
    identity = json['identity'];
    roleId = json['roleId'];
    roleName = json['roleName'];
    organizationId = json['organizationId'];
    organizationName = json['organizationName'];
    userType = json['userType'];
    phone = json['phone'];
    enable = json['enable'];
    editable = json['editable'];
    loginIp = json['loginIp'];
    loginAddress = json['loginAddress'];
    loginAt = json['loginAt'];
    loginFirst = json['loginFirst'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['permissionList'] != null) {
      permissionList = <PermissionList>[];
      json['permissionList'].forEach((v) {
        permissionList.add(PermissionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tenantId'] = tenantId;
    data['identity'] = identity;
    data['roleId'] = roleId;
    data['roleName'] = roleName;
    data['organizationId'] = organizationId;
    data['organizationName'] = organizationName;
    data['userType'] = userType;
    data['phone'] = phone;
    data['enable'] = enable;
    data['editable'] = editable;
    data['loginIp'] = loginIp;
    data['loginAddress'] = loginAddress;
    data['loginAt'] = loginAt;
    data['loginFirst'] = loginFirst;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (permissionList != null) {
      data['permissionList'] = permissionList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PermissionList {
  String id;
  String code;
  String name;
  String type;
  int menuOrder;
  List<dynamic> permissions;

  PermissionList({id, code, name, type, menuOrder, permissions});

  PermissionList.fromJson(Map<String, dynamic> json) {
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

class Permissions {
  String id;
  String code;
  String name;
  String type;
  int menuOrder;
  List<dynamic> permissions;

  Permissions({id, code, name, type, menuOrder, permissions});

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    type = json['type'];
    menuOrder = json['menuOrder'];
    permissions = json['permissions'];
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
