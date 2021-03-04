class Tenant {
  String id;
  String name;
  String adminUserId;
  String adminUserName;
  String adminUserIdentity;
  String phone;
  String address;
  String description;
  int enable;
  TenantLogo tenantLogo;
  String location;
  dynamic longitude;
  dynamic latitude;
  int createdAt;
  int updatedAt;

  Tenant(
      {id,
      name,
      adminUserId,
      adminUserName,
      adminUserIdentity,
      phone,
      address,
      description,
      enable,
      tenantLogo,
      location,
      longitude,
      latitude,
      createdAt,
      updatedAt});

  Tenant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adminUserId = json['adminUserId'];
    adminUserName = json['adminUserName'];
    adminUserIdentity = json['adminUserIdentity'];
    phone = json['phone'];
    address = json['address'];
    description = json['description'];
    enable = json['enable'];
    tenantLogo = json['tenantLogo'] != null
        ? TenantLogo.fromJson(json['tenantLogo'])
        : null;
    location = json['location'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['adminUserId'] = adminUserId;
    data['adminUserName'] = adminUserName;
    data['adminUserIdentity'] = adminUserIdentity;
    data['phone'] = phone;
    data['address'] = address;
    data['description'] = description;
    data['enable'] = enable;
    if (tenantLogo != null) {
      data['tenantLogo'] = tenantLogo.toJson();
    }
    data['location'] = location;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class TenantLogo {
  Null generalLogoPath;
  Null darkLogoPath;
  Null lightLogoPath;

  TenantLogo({generalLogoPath, darkLogoPath, lightLogoPath});

  TenantLogo.fromJson(Map<String, dynamic> json) {
    generalLogoPath = json['generalLogoPath'];
    darkLogoPath = json['darkLogoPath'];
    lightLogoPath = json['lightLogoPath'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['generalLogoPath'] = generalLogoPath;
    data['darkLogoPath'] = darkLogoPath;
    data['lightLogoPath'] = lightLogoPath;
    return data;
  }
}

class TenantList {
  int pageIndex;
  int pageSize;
  int totalRecords;
  List<Tenant> data;

  TenantList({this.pageIndex, this.pageSize, this.totalRecords, this.data});

  TenantList.fromJson(Map json) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    totalRecords = json['totalRecords'];

    if (json['data'] != null) {
      data = new List<Tenant>();
      (json['data'] as List).forEach((v) {
        data.add(new Tenant.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['totalRecords'] = this.totalRecords;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
