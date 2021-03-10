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

class DataStatisticsRatio {
  int total;
  List<Map<String, dynamic>> type;

  DataStatisticsRatio({
    total,
  });

  DataStatisticsRatio.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['type'] != null) {
      type = [];
      json['type'].forEach((v) {
        type.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total'] = total;
    if (type != null) {
      data['type'] = type.map((v) => v).toList();
    }
    return data;
  }
}

class Trend {
  int yactive;
  int ytotal;
  int xtime;

  Trend({yactive, ytotal, xtime});

  Trend.fromJson(Map<String, dynamic> json) {
    yactive = json['yactive'];
    ytotal = json['ytotal'];
    xtime = json['xtime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['yactive'] = yactive;
    data['ytotal'] = ytotal;
    data['xtime'] = xtime;
    return data;
  }
}

class TelemetryTrend {
  int total;
  List<dynamic> histories;

  TelemetryTrend({total, histories});

  TelemetryTrend.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['histories'] != null) {
      histories = <Telemetry>[];
      json['histories'].forEach((v) {
        histories.add(Telemetry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total'] = total;
    if (histories != null) {
      data['histories'] = histories.map((v) => v).toList();
    }
    return data;
  }
}

class Telemetry {
  int x;
  int y;

  Telemetry({x, y});

  Telemetry.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}

class ActionTrend {
  int total;
  List<dynamic> histories;

  ActionTrend({total, histories});

  ActionTrend.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['histories'] != null) {
      histories = <Telemetry>[];
      json['histories'].forEach((v) {
        histories.add(Telemetry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total'] = total;
    if (histories != null) {
      data['histories'] = histories.map((v) => v).toList();
    }
    return data;
  }
}

class Action {
  int x;
  int y;

  Action({x, y});

  Action.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}
