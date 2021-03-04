import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';
// import 'package:aiot/app/modules/dashboard/components/barChart/barChart.dart';
// import 'package:aiot/app/modules/dashboard/components/cardGrid/cardGrid.dart';
// import 'package:aiot/app/modules/dashboard/components/labellineChart/labellineChart.dart';
// import 'package:aiot/app/modules/dashboard/components/lineChart/lineChart.dart';
// import 'package:aiot/app/modules/dashboard/components/pieChart/pieChart.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'DashboardView',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200.0,
                color: Color(0xffe4e4e4),
                child: Text('数据统计'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 8,
                shadowColor: Color(0xffffffff),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: Text('设备统计'),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 8,
                shadowColor: Color(0xffffffff),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: Text('设备接入Top5'),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 8,
                shadowColor: Color(0xffffffff),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: Text('设备比例'),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 8,
                shadowColor: Color(0xffffffff),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: Text('消息上报'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
