// import 'dart:ui';

import 'package:aiot/app/modules/dashboard/components/lineChartaTrend/lineChartTrend.dart';
import 'package:get/get.dart';
import 'package:aiot/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';

class TelemetryTrend extends StatefulWidget {
  const TelemetryTrend({
    Key key,
  }) : super(key: key);

  @override
  _LineChartAiotState createState() => _LineChartAiotState();
}

class _LineChartAiotState extends State<TelemetryTrend> {
  @override
  Widget build(BuildContext context) {
    final DashboardController c = Get.find();
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
                right: 0.0, left: 0.0, top: 50, bottom: 12),
            child: Obx(
              () => c.telemetryTrendList.length > 0
                  ? LineChartTrend(data: c.telemetryTrendList)
                  : Center(
                      child: Text('暂无数据'),
                    ),
            ),
          ),
          Positioned(
            top: 20,
            left: 34,
            child: Text(
              '消息上报',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 34,
            child: Obx(
              () => Text(
                c.telemetryTotal.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
