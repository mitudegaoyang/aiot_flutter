// import 'dart:ui';

// import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
                right: 0.0, left: 0.0, top: 50, bottom: 12),
            child: LineChart(
              mainData(),
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

  LineChartData mainData() {
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
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1612800000000, 3),
        FlSpot(1612886400000, 2),
        FlSpot(1612972800000, 5),
        FlSpot(1613059200000, 3.1),
        FlSpot(1613145600000, 4),
        FlSpot(1613232000000, 3),
        FlSpot(1613318400000, 4),
        FlSpot(1613404800000, 6),
        FlSpot(1613491200000, 6),
        FlSpot(1613577600000, 6),
        FlSpot(1613664000000, 3),
        FlSpot(1613750400000, 6),
        FlSpot(1613836800000, 6),
        FlSpot(1613923200000, 60),
        FlSpot(1614009600000, 6),
        FlSpot(1614096000000, 6),
        FlSpot(1614182400000, 6),
        FlSpot(1614268800000, 6),
        FlSpot(1614355200000, 6),
        FlSpot(1614441600000, 6),
        FlSpot(1614528000000, 6),
        FlSpot(1614614400000, 6),
        FlSpot(1614700800000, 6),
        FlSpot(1614787200000, 6),
        FlSpot(1614873600000, 6),
        FlSpot(1614960000000, 60),
        FlSpot(1615046400000, 6),
        FlSpot(1615132800000, 6),
      ],
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

    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1612800000000, 36),
        FlSpot(1612886400000, 20),
        FlSpot(1612972800000, 50),
        FlSpot(1613059200000, 3.1),
        FlSpot(1613145600000, 41),
        FlSpot(1613232000000, 32),
        FlSpot(1613318400000, 4),
        FlSpot(1613404800000, 16),
        FlSpot(1613491200000, 16),
        FlSpot(1613577600000, 16),
        FlSpot(1613664000000, 13),
        FlSpot(1613750400000, 16),
        FlSpot(1613836800000, 16),
        FlSpot(1613923200000, 16),
        FlSpot(1614009600000, 16),
        FlSpot(1614096000000, 16),
        FlSpot(1614182400000, 16),
        FlSpot(1614268800000, 16),
        FlSpot(1614355200000, 16),
        FlSpot(1614441600000, 16),
        FlSpot(1614528000000, 16),
        FlSpot(1614614400000, 16),
        FlSpot(1614700800000, 16),
        FlSpot(1614787200000, 16),
        FlSpot(1614873600000, 16),
        FlSpot(1614960000000, 10),
        FlSpot(1615046400000, 16),
        FlSpot(1615132800000, 16),
      ],
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
    return [lineChartBarData1, lineChartBarData2];
  }
}
