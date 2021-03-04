// import 'dart:ui';

// import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 12.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
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
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            if (value.toInt() % 2 == 0) {
              return value.toInt().toString() + '月';
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
      minX: 1,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(0, 3),
        FlSpot(2.6, 2),
        FlSpot(4.9, 5),
        FlSpot(6.8, 3.1),
        FlSpot(8, 4),
        FlSpot(9.5, 3),
        FlSpot(11, 4),
        FlSpot(12, 6),
      ],
      isCurved: true,
      colors: gradientColors,
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
      ),
    );
    return [lineChartBarData1];
  }
}
