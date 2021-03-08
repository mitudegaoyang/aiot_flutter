import 'package:aiot/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:aiot/app/modules/dashboard/views/dashboard_view.dart';
import 'package:aiot/app/modules/home/bindings/home_binding.dart';
import 'package:aiot/app/modules/home/views/home_view.dart';
import 'package:aiot/app/modules/server/views/add_view.dart';
import 'package:aiot/app/modules/tenant/bindings/tenant_binding.dart';
import 'package:aiot/app/modules/tenant/views/tenant_view.dart';
import 'package:aiot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/server_controller.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// https://www.jianshu.com/p/e74286d2e14c

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
                  expand: false,
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
                  ServerItem(),
                  // ServerItem(),
                  // ServerItem(),
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

class ServerItem extends StatelessWidget {
  const ServerItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1a000000),
              offset: Offset(3, 5),
              blurRadius: 22,
            ),
          ],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              // color: const Color(0xffffffff),
              // color: Colors.red,
            ),
            child: new InkWell(
              borderRadius: new BorderRadius.circular(16.0), //给水波纹也设置同样的圆角
              onTap: () {
                print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
              },
              child: new Container(
                padding: EdgeInsets.all(kDefaultPadding / 2),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: kPrimaryGradient,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding / 2),
                      child: Column(
                        children: [
                          Text(
                            'MacBook Pro',
                            style: TextStyle(
                                color: kNeutralDarkBlueColor,
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          SizedBox(
                            height: kDefaultPadding / 4,
                          ),
                          Text(
                            'Order #792462',
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color(0xff91909a),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          '+\$275,85',
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xff4953ed),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // child: InkWell(

            //   onTap: () {},
            //   child: Container(
            //     child: Container(
            //       padding: EdgeInsets.all(kDefaultPadding / 2),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(16.0),
            //         color: const Color(0xffffffff),
            //         // color: Colors.red,
            //         boxShadow: [
            //           BoxShadow(
            //             color: const Color(0x1a000000),
            //             offset: Offset(3, 5),
            //             blurRadius: 22,
            //           ),
            //         ],
            //       ),
            //       child: Container(
            //         // margin: EdgeInsets.all(kDefaultPadding / 2),
            // ,
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
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
