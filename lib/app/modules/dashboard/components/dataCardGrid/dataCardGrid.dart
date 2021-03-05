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
      // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: colors[0],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: colors.length != 1
            ? LinearGradient(
                colors: colors,
              )
            : null,
      ),
      child: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 18.0, bottom: 5.0),
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
          Positioned(
            left: -110.0,
            right: 80.0,
            top: -10.0,
            bottom: -150.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
                color: Color(0x33FFFFFF),
              ),
            ),
          ),
          Positioned(
            left: 30.0,
            right: -20.0,
            top: 50.0,
            bottom: -150.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
                color: Color(0x33FFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
