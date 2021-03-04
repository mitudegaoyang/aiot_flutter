import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tenant_controller.dart';

class TenantView extends GetView<TenantController> {
  final TenantController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('TenantView${c.tenantlist.value.totalRecords}')),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: c.tenantlist.value.data == null
                ? 0
                : c.tenantlist.value.data.length,
            itemBuilder: (context, index) {
              // print("index:${index.isOdd}");
              // 在每一列之前，添加一个1像素高的分隔线widget
              // if (index.isOdd) return new Divider();
              final tenant = c.tenantlist.value.data[index];
              return GestureDetector(
                  child: ListTile(
                    title: Text(
                      '${tenant.name}',
                    ),
                  ),
                  onTap: () {});
            },
          )),
    );
  }
}
