import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tenant_controller.dart';

class TenantView extends GetView<TenantController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TenantView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TenantView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
