import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:aiot/app/modules/home/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Obx(
          () => c.user != null
              ? Text(
                  '欢迎您 ${c.user.value.name} ！',
                  style: TextStyle(fontSize: 20),
                )
              : Text(
                  '1',
                  style: TextStyle(fontSize: 20),
                ),
        ),
      ),
    );
  }
}
