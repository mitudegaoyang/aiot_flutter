// import 'dart:ui';

// import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DeviceTop extends StatelessWidget {
  const DeviceTop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: Text('设备接入Top5'),
      ),
    );
  }
}
