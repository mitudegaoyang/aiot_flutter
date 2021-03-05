// import 'dart:ui';

// import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DataCardGrid extends StatelessWidget {
  const DataCardGrid({
    Key key,
    this.title,
    this.num,
    this.colors,
  }) : super(key: key);

  final String title;
  final int num;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: colors[0],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // gradient: colors.length != 1
        //     ? RadialGradient(
        //         colors: colors,
        //         radius: 1,
        //         tileMode: TileMode.repeated,
        //       )
        //     : null,
        gradient: colors.length != 1
            ? LinearGradient(
                colors: colors,
              )
            : null,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '${num.toString()}',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
