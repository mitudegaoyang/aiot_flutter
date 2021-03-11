// import 'dart:ui';

import 'package:aiot/app/modules/dashboard/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:day/day.dart';

class LineChartTrend extends StatefulWidget {
  const LineChartTrend({
    Key key,
    this.data,
  }) : super(key: key);

  final List<dynamic> data;

  @override
  _LineChartAiotState createState() => _LineChartAiotState(this.data);
}

class _LineChartAiotState extends State<LineChartTrend> {
  _LineChartAiotState(this.data);
  final List<dynamic> data;

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  List<FlSpot> yData = [];

  @override
  Widget build(BuildContext context) {
    print(data);

    return LineChart(mainData(this.data));
  }

  LineChartData mainData(c) {
    yData = [];
    for (Telemetry t in c) {
      yData.add(FlSpot(t.x.toDouble(), t.y.toDouble()));
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
          interval: 1000,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            final d = Day.fromUnix(value.toInt());
            final now = Day().add(10, 's');
            if (now.diff(d, 's') % 30 == 0) {
              return d.format('mm:ss');
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false, // 是否显示y轴图例
          // getTextStyles: (value) => const TextStyle(
          //   color: Color(0xff67727d),
          //   fontWeight: FontWeight.bold,
          //   fontSize: 15,
          // ),
          // getTitles: (value) {
          //   switch (value.toInt()) {
          //     case 1:
          //       return '10k';
          //     case 3:
          //       return '30k';
          //     case 5:
          //       return '50k';
          //   }
          //   return '';
          // },
          // reservedSize: 28,
          // margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: false, // 是否显示边框
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      // minX: 1,
      // maxX: 11,
      minY: 0,
      // maxY: 6,
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
            // tooltipBgColor: Color(0xBB02d39a),
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
          return touchedBarSpots.map(
            (barSpot) {
              return LineTooltipItem(
                '${barSpot.y.toInt()}',
                TextStyle(
                  color: gradientColors[0],
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ).toList();
        }),
      ),
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: yData,
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
