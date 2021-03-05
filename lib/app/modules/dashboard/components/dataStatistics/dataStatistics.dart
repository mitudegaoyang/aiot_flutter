// import 'dart:ui';

// import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aiot/app/modules/dashboard/components/dataCardGrid/dataCardGrid.dart';

class DataStatistics extends StatelessWidget {
  const DataStatistics({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            DataCardGrid(
              title: "组织机构数",
              num: 15,
              colors: [Color(0xFF555DEC), Color(0xFF6D0BBD)],
            ),
            DataCardGrid(
              title: "用户总数",
              num: 156,
              colors: [Color(0xFFFD6E5E), Color(0xFFFE9F67)],
            ),
            DataCardGrid(
              title: "产品总数",
              num: 33,
              colors: [Color(0xFF50D7B1), Color(0xFF85ED6D)],
            ),
            DataCardGrid(
              title: "设备总数",
              num: 3015,
              colors: [Color(0xFF26C7EE), Color(0xFF53F4EC)],
            ),
            DataCardGrid(
              title: "应用总数",
              num: 0,
              colors: [Color(0xFF555DEC), Color(0xFF6D0BBD)],
            ),
            DataCardGrid(
              title: "规则总数",
              num: 1,
              colors: [Color(0xFFFD6E5E), Color(0xFFFE9F67)],
            ),
            DataCardGrid(
              title: "告警总数",
              num: 1,
              colors: [Color(0xFF50D7B1), Color(0xFF85ED6D)],
            ),
            DataCardGrid(
              title: "工单总数",
              num: 0,
              colors: [Color(0xFF26C7EE), Color(0xFF53F4EC)],
            ),
          ],
        ),
      ),
    );
  }
}
