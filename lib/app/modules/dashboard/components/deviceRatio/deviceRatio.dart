// import 'dart:ui';

// import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DeviceRatio extends StatelessWidget {
  const DeviceRatio({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: Text('设备比例'),
      ),
    );
  }
}
