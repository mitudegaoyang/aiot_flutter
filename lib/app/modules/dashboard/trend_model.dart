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

class TrendList {
  List<Trend> data;

  TrendList({this.data});

  TrendList.fromJson(List json) {
    if (json != null) {
      data = new List<Trend>();
      (json as List).forEach((v) {
        data.add(new Trend.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
