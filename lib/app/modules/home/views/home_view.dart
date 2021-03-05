import 'package:aiot/app/modules/tenant/bindings/tenant_binding.dart';
import 'package:aiot/app/modules/tenant/views/tenant_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:aiot/app/modules/home/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final AuthController c = Get.find();
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
      body: Column(
        children: [
          Obx(
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
          FlatButton(
            child: Text('Go Tenant Page'),
            color: Colors.blue,
            onPressed: () {
              Get.to(TenantView(), binding: TenantBinding());
              // Get.toNamed('/tenant');
            },
          ),
          FlatButton(
            child: Text('Go Tenant Dashboard'),
            color: Colors.blue,
            onPressed: () {
              Get.toNamed('/dashboard');
            },
          )
        ],
      ),
    );
  }
}
