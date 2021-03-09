class DataStatistics {
  int alarmTotal;
  int appTotal;
  int deviceTotal;
  int organizationTotal;
  int productTotal;
  int ruleTotal;
  int userTotal;
  int workflowTotal;
  List<DataStatistics> permissions;

  DataStatistics({
    alarmTotal,
    appTotal,
    deviceTotal,
    organizationTotal,
    productTotal,
    ruleTotal,
    userTotal,
    workflowTotal,
  });

  DataStatistics.fromJson(Map<String, dynamic> json) {
    alarmTotal = json['alarmTotal'];
    appTotal = json['appTotal'];
    deviceTotal = json['deviceTotal'];
    organizationTotal = json['organizationTotal'];
    productTotal = json['productTotal'];
    ruleTotal = json['ruleTotal'];
    userTotal = json['userTotal'];
    workflowTotal = json['workflowTotal'];
    if (json['permissions'] != null) {
      permissions = <DataStatistics>[];
      json['permissions'].forEach((v) {
        permissions.add(DataStatistics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['alarmTotal'] = alarmTotal;
    data['appTotal'] = appTotal;
    data['deviceTotal'] = deviceTotal;
    data['organizationTotal'] = organizationTotal;
    data['productTotal'] = productTotal;
    data['ruleTotal'] = ruleTotal;
    data['userTotal'] = userTotal;
    data['workflowTotal'] = workflowTotal;
    if (permissions != null) {
      data['permissions'] = permissions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeviceTop {
  String deviceName;
  int deviceNum;
  String rate;

  DeviceTop({deviceName, deviceNum, rate});

  DeviceTop.fromJson(Map<String, dynamic> json) {
    deviceName = json['deviceName'];
    deviceNum = json['deviceNum'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['deviceName'] = deviceName;
    data['deviceNum'] = deviceNum;
    data['rate'] = rate;
    return data;
  }
}
