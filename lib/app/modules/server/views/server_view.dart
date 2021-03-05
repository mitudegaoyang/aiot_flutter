import 'package:aiot/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:aiot/app/modules/dashboard/views/dashboard_view.dart';
import 'package:aiot/app/modules/home/bindings/home_binding.dart';
import 'package:aiot/app/modules/home/views/home_view.dart';
import 'package:aiot/app/modules/server/views/add_view.dart';
import 'package:aiot/app/modules/tenant/bindings/tenant_binding.dart';
import 'package:aiot/app/modules/tenant/views/tenant_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/server_controller.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ServerView extends GetView<ServerController> {
  final ServerController c = Get.find();

  @override
  Widget build(BuildContext context) {
    print("111");
    print(c.servers);
    return Material(
      child: Scaffold(
        body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            transitionBetweenRoutes: false,
            middle: Text('Server'),
            trailing: GestureDetector(
              child: Icon(Icons.arrow_forward),
              onTap: () {
                showCupertinoModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => AddView(),
                );
              },
            ),
          ),
          child: SafeArea(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Get.to(
                        HomeView(),
                        binding: HomeBinding(),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Tenant'),
                    leading: Icon(Icons.account_circle),
                    onTap: () {
                      Get.to(TenantView(), binding: TenantBinding());
                    },
                  ),
                  ListTile(
                    title: Text('Dashboard'),
                    leading: Icon(Icons.dashboard),
                    onTap: () {
                      Get.to(DashboardView(), binding: DashboardBinding());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     c.getAllServer();
        //   },
        //   child: Icon(
        //     Icons.add,
        //     size: 35.0,
        //   ),
        //   backgroundColor: Color(0xFFFE301C),
        // ),
      ),
    );
  }
}

//  Obx(
//                   () => Text(
//                     'Server count: ${c.servers.length}',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
