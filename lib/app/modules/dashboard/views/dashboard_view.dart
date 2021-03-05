import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';
import 'package:aiot/app/modules/dashboard/components/dataStatistics/dataStatistics.dart';
import 'package:aiot/app/modules/dashboard/components/deviceStatistics/deviceStatistics.dart';
import 'package:aiot/app/modules/dashboard/components/deviceTop/deviceTop.dart';
import 'package:aiot/app/modules/dashboard/components/deviceRatio/deviceRatio.dart';
import 'package:aiot/app/modules/dashboard/components/telemetryTrend/telemetryTrend.dart';

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
                height: 109.0,
                color: Color(0xffffffff),
                child: DataStatistics(),
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
                  child: DeviceStatistics(),
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
                  height: 280.0,
                  child: DeviceTop(),
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
                  height: 260.0,
                  child: DeviceRatio(),
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
                  child: TelemetryTrend(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
