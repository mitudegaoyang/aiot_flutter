import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/server_controller.dart';

class ServerView extends GetView<ServerController> {
  final ServerController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ServerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ServerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
