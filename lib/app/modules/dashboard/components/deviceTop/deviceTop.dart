// import 'dart:ui';

// import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DeviceTop extends StatelessWidget {
  const DeviceTop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.red,
            //     width: 3,
            //     style: BorderStyle.solid,
            //   ),
            // ),
            padding: const EdgeInsets.only(
                right: 12.0, left: 12.0, top: 50, bottom: 12),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 20,
                barTouchData: BarTouchData(
                  enabled: false,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.transparent,
                    tooltipPadding: const EdgeInsets.all(0),
                    tooltipBottomMargin: 8,
                    getTooltipItem: (
                      BarChartGroupData group,
                      int groupIndex,
                      BarChartRodData rod,
                      int rodIndex,
                    ) {
                      return BarTooltipItem(
                        rod.y.round().toString(),
                        TextStyle(
                          color: Color(0xff68737d),
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  // 定义x，y轴的标题
                  show: true,
                  bottomTitles: SideTitles(
                    // x轴标题
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                      color: Color(0xff68737d),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    margin: 20,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Mn';
                        case 1:
                          return 'Te';
                        case 2:
                          return 'Wd';
                        case 3:
                          return 'Tu';
                        case 4:
                          return 'Fr';
                        case 5:
                          return 'St';
                        case 6:
                          return 'Sn';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    // 不显示y轴标题
                    showTitles: false,
                    // getTextStyles: (value) => const TextStyle(
                    //   color: Color(0xff67727d),
                    //   fontWeight: FontWeight.bold,
                    //   fontSize: 14,
                    // ),
                    // margin: 16,
                    // reservedSize: 14,
                    // getTitles: (value) {
                    //   if (value == 0) {
                    //     return '1K';
                    //   } else if (value == 10) {
                    //     return '5K';
                    //   } else if (value == 19) {
                    //     return '10K';
                    //   } else {
                    //     return '';
                    //   }
                    // },
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                          y: 8,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                          y: 10,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                          y: 14,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                          y: 15,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                          y: 13,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                          y: 10,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            left: 34.0,
            child: Text(
              '设备接入Top5',
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
}
