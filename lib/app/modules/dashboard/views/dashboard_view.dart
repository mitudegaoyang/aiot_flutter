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
        title: Text('DashboardView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
