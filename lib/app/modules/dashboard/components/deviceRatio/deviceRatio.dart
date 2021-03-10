// import 'dart:ui';

// import 'package:get/get.dart';
import 'dart:developer';

import 'package:aiot/app/modules/dashboard/controllers/ratio_controller.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import '../../../../../utils/indicator_utils.dart';

class DeviceRatio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeviceRatioState();
}

class DeviceRatioState extends State {
  final RatioController c = Get.find();
  int touchedIndex;
  List<dynamic> data = [];
  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox.expand(
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    right: 12.0, left: 12.0, top: 50, bottom: 12),
                child: c.dataStatisticsRatio.value != null &&
                        // c.dataStatisticsRatio.value.type != null &&
                        // c.dataStatisticsRatio.value.type.length > 0 &&
                        c.dataStatisticsRatio.value.total != null &&
                        c.dataStatisticsRatio.value.total > 0
                    ? Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          SizedBox(
                            width: 200,
                            child: Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: PieChart(
                                    PieChartData(
                                        pieTouchData: PieTouchData(
                                            touchCallback: (pieTouchResponse) {
                                          setState(() {
                                            if (pieTouchResponse.touchInput
                                                    is FlLongPressEnd ||
                                                pieTouchResponse.touchInput
                                                    is FlPanEnd) {
                                              touchedIndex = -1;
                                            } else {
                                              touchedIndex = pieTouchResponse
                                                  .touchedSectionIndex;
                                            }
                                          });
                                        }),
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        sectionsSpace: 1,
                                        centerSpaceRadius: 40,
                                        startDegreeOffset: -90,
                                        sections: showingSections(
                                            c.dataStatisticsRatio.value.type)),
                                  ),
                                ),
                                Positioned(
                                  top: 80.0,
                                  left: 80.0,
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                        c.dataStatisticsRatio.value.total
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              // mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  showTitle(c.dataStatisticsRatio.value.type),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text('暂无数据'),
                      ),
              ),
              Positioned(
                top: 20.0,
                left: 34.0,
                child: Text(
                  '设备比例',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[500],
                    decoration: TextDecoration.none,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  final ratioColor = {
    0: Color(0xff0293ee),
    1: Color(0xfff8b250),
    2: Color(0xff13d38e)
  };

  List<Widget> showTitle(c) {
    List<Map<String, dynamic>> data = c;
    if (data?.isNotEmpty ?? false) {
      return new List<Widget>.from(data.asMap().keys.map((i) {
        return Container(
          decoration: BoxDecoration(),
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Indicator(
                color: ratioColor[i] ?? Color(0xff0293ee),
                text: data[i]["item"],
                isSquare: true,
                size: 10,
              ),
              SizedBox(
                height: 4,
              )
            ],
          ),
        );
      }));
    } else {
      return [];
    }
  }

  List<PieChartSectionData> showingSections(c) {
    List<Map<String, dynamic>> data = c;
    double total = 0;
    if (data?.isNotEmpty ?? false) {
      //计算total
      for (int i = 0; i < data.length; i++) {
        total += data[i]['count'];
      }
      return new List<PieChartSectionData>.from(data.asMap().keys.map((i) {
        final isTouched = i == touchedIndex;
        final double fontSize = isTouched ? 20 : 14;
        final double radius = isTouched ? 60 : 50;
        String count = "0";
        if (data[i]['count'] > 0) {
          count = "${(data[i]['count'] / total * 100).round()}%";
        }
        return PieChartSectionData(
          color: ratioColor[i] ?? Color(0xff0293ee),
          value: data[i]['count'].toDouble(),
          title: count,
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      })).toList();
      // data.forEach((value) {
      //   print("${value.toString()}  ------");
      //   return PieChartSectionData(
      //     color: const Color(0xff0293ee),
      //     value: 40.0,
      //     title: "gateway",
      //     radius: 50,
      //     titleStyle: TextStyle(
      //         fontSize: 16,
      //         fontWeight: FontWeight.bold,
      //         color: const Color(0xffffffff)),
      //   );
      // });
    } else {
      return [];
    }
  }
}
