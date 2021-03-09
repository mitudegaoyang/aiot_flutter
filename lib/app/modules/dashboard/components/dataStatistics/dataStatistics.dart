// import 'dart:ui';

import 'package:aiot/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aiot/app/modules/dashboard/components/dataCardGrid/dataCardGrid.dart';

class DataStatistics extends StatelessWidget {
  final DashboardController c = Get.find();

  @override
  Widget build(BuildContext context) {
    print('c.dataStatistics.value.organizationTotal');
    print(c.dataStatistics.value.organizationTotal);
    return SizedBox.expand(
      child: Container(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Obx(
              () => DataCardGrid(
                title: "组织机构数",
                num: c.dataStatistics.value.organizationTotal != null
                    ? c.dataStatistics.value.organizationTotal
                    : 0,
                colors: [Color(0xFF555DEC), Color(0xFF6D0BBD)],
              ),
            ),
            Obx(
              () => DataCardGrid(
                title: "用户总数",
                num: c.dataStatistics.value.userTotal != null
                    ? c.dataStatistics.value.userTotal
                    : 0,
                colors: [Color(0xFFFD6E5E), Color(0xFFFE9F67)],
              ),
            ),
            Obx(
              () => DataCardGrid(
                title: "产品总数",
                num: c.dataStatistics.value.productTotal != null
                    ? c.dataStatistics.value.productTotal
                    : 0,
                colors: [Color(0xFFFF8733), Color(0xFFF7B733)],
              ),
            ),
            Obx(
              () => DataCardGrid(
                title: "设备总数",
                num: c.dataStatistics.value.deviceTotal != null
                    ? c.dataStatistics.value.deviceTotal
                    : 0,
                colors: [Color(0xFFE49971), Color(0xFFE4B971)],
              ),
            ),
            Obx(
              () => DataCardGrid(
                title: "应用总数",
                num: c.dataStatistics.value.appTotal != null
                    ? c.dataStatistics.value.appTotal
                    : 0,
                colors: [Color(0xFF50D7B1), Color(0xFF85ED6D)],
              ),
            ),
            Obx(
              () => DataCardGrid(
                title: "规则总数",
                num: c.dataStatistics.value.ruleTotal != null
                    ? c.dataStatistics.value.ruleTotal
                    : 0,
                colors: [Color(0xFF53C4EC), Color(0xFF53F4EC)],
              ),
            ),
            Obx(
              () => DataCardGrid(
                title: "告警总数",
                num: c.dataStatistics.value.alarmTotal != null
                    ? c.dataStatistics.value.alarmTotal
                    : 0,
                colors: [Color(0xFFFDAFA7), Color(0xFFFDDFA7)],
              ),
            ),
            Obx(
              () => DataCardGrid(
                title: "工单总数",
                num: c.dataStatistics.value.workflowTotal != null
                    ? c.dataStatistics.value.workflowTotal
                    : 0,
                colors: [Color(0xFFC996FF), Color(0xFFC9C6FF)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
