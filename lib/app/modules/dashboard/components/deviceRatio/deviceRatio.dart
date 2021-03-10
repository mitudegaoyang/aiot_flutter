// import 'dart:ui';

// import 'package:get/get.dart';
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
                child: Row(
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
                                  c.dataStatisticsRatio.value.total.toString(),
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
                      // child: AspectRatio(
                      //   aspectRatio: 1,
                      //   child: PieChart(
                      //     PieChartData(
                      //         pieTouchData: PieTouchData(
                      //             touchCallback: (pieTouchResponse) {
                      //           setState(() {
                      //             if (pieTouchResponse.touchInput
                      //                     is FlLongPressEnd ||
                      //                 pieTouchResponse.touchInput is FlPanEnd) {
                      //               touchedIndex = -1;
                      //             } else {
                      //               touchedIndex =
                      //                   pieTouchResponse.touchedSectionIndex;
                      //             }
                      //           });
                      //         }),
                      //         borderData: FlBorderData(
                      //           show: false,
                      //         ),
                      //         sectionsSpace: 1,
                      //         centerSpaceRadius: 40,
                      //         startDegreeOffset: -90,
                      //         sections: showingSections(
                      //             c.dataStatisticsRatio.value.type)),
                      //   ),
                      // ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: showTitle(c.dataStatisticsRatio.value.type),
                      ),
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                  ],
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
    List<Map<String, dynamic>> data = [];
    data = c;
    if (data?.isNotEmpty ?? false) {
      return new List<Widget>.from(data.asMap().keys.map((i) {
        return Container(
          decoration: BoxDecoration(),
          child: Column(
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
    List<Map<String, dynamic>> data = [];
    double total = 0;
    data = c;
    if (data?.isNotEmpty ?? false) {
      //计算total
      for (int i = 0; i < data.length; i++) {
        total += data[i]['count'];
      }
      return new List<PieChartSectionData>.from(data.asMap().keys.map((i) {
        final isTouched = i == touchedIndex;
        final double fontSize = isTouched ? 25 : 14;
        final double radius = isTouched ? 70 : 50;
        return PieChartSectionData(
          color: ratioColor[i] ?? Color(0xff0293ee),
          value: data[i]['count'].toDouble(),
          title: "${data[i]['count'] / total * 100}%",
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
      return List.generate(4, (i) {
        final isTouched = i == touchedIndex;
        final double fontSize = isTouched ? 25 : 16;
        final double radius = isTouched ? 60 : 50;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xff0293ee),
              value: 40,
              title: 'getaway',
              radius: radius,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff)),
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xfff8b250),
              value: 30,
              title: '30%',
              radius: radius,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff)),
            );
          case 2:
            return PieChartSectionData(
              color: const Color(0xff845bef),
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff)),
            );
          case 3:
            return PieChartSectionData(
              color: const Color(0xff13d38e),
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff)),
            );
          default:
            return null;
        }
      });
    }
  }
}
