// import 'dart:ui';

import 'package:aiot/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:aiot/app/modules/dashboard/trend_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:day/day.dart';

class DeviceStatistics extends StatefulWidget {
  const DeviceStatistics({
    Key key,
  }) : super(key: key);

  @override
  _LineChartAiotState createState() => _LineChartAiotState();
}

class _LineChartAiotState extends State<DeviceStatistics> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff23e6e6),
  ];
  List<Color> gradientColors2 = [
    const Color(0xff02a39a),
    const Color(0xff02d39a),
  ];

  // List data = [
  //   {"yactive": 2, "ytotal": 3, "xtime": 1612800000000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1612886400000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1612972800000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613059200000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613145600000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613232000000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613318400000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613404800000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613491200000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613577600000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613664000000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613750400000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613836800000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1613923200000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614009600000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614096000000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614182400000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614268800000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614355200000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614441600000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614528000000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614614400000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614700800000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614787200000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614873600000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1614960000000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1615046400000},
  //   {"yactive": 2, "ytotal": 3, "xtime": 1615132800000}
  // ];
  List<FlSpot> yactive = [];
  List<FlSpot> ytotal = [];

  @override
  Widget build(BuildContext context) {
    final DashboardController c = Get.find();
    yactive = [];
    ytotal = [];
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
                right: 0.0, left: 0.0, top: 50, bottom: 12),
            child: Obx(
              () => c.trendList.length > 0
                  ? LineChart(
                      mainData(c.trendList),
                    )
                  : Text('暂无数据'),
            ),
          ),
          Positioned(
            top: 20,
            left: 34,
            child: Text(
              '设备统计',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
                decoration: TextDecoration.none,
              ),
            ),
          )
        ],
      ),
    );
  }

  LineChartData mainData(c) {
    for (Trend t in c) {
      yactive.add(FlSpot(t.xtime.toDouble(), t.yactive.toDouble()));
      ytotal.add(FlSpot(t.xtime.toDouble(), t.ytotal.toDouble()));
    }
    return LineChartData(
      gridData: FlGridData(
        show: false, // 网格线
        drawVerticalLine: false, // 垂直网格线
        // getDrawingHorizontalLine: (value) {
        //   return FlLine(
        //     color: const Color(0xff37434d),
        //     strokeWidth: 1,
        //   );
        // },
        // getDrawingVerticalLine: (value) {
        //   return FlLine(
        //     color: const Color(0xff37434d),
        //     strokeWidth: 1,
        //   );
        // },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true, // 是否显示x轴图例
          reservedSize: 22,
          interval: 86400000,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            final d = Day.fromUnix(value.toInt());
            final now = Day().add(4, 'd');
            if (now.diff(d, 'd') % 7 == 0) {
              return d.format('MM/DD');
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false, // 是否显示y轴图例
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: false, // 是否显示边框
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      // minX: 1,
      // maxX: 12,
      minY: 0,
      // maxY: 6,
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Color(0x00555DEC),
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                return LineTooltipItem(
                  '${barSpot.barIndex == 0 ? '总数' : '激活'} ${barSpot.y.toInt()}',
                  const TextStyle(color: Colors.grey),
                );
              }).toList();
            }),
      ),
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    final LineChartBarData lineChartBarDataTotal = LineChartBarData(
      spots: ytotal,
      isCurved: true,
      colors: gradientColors,
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false, // 是否显示面积图
        colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
      ),
    );

    final LineChartBarData lineChartBarDataActive = LineChartBarData(
      spots: yactive,
      isCurved: true,
      colors: gradientColors2,
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false, // 是否显示面积图
        colors: gradientColors2.map((color) => color.withOpacity(0.3)).toList(),
      ),
    );

    return [lineChartBarDataTotal, lineChartBarDataActive];
  }
}
