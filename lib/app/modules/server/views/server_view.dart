import 'package:aiot/app/components/shadow_card/shadow_card.dart';
import 'package:aiot/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:aiot/app/modules/dashboard/views/dashboard_view.dart';
import 'package:aiot/app/modules/home/bindings/home_binding.dart';
import 'package:aiot/app/modules/home/controllers/auth_controller.dart';
import 'package:aiot/app/modules/home/user_model.dart';
import 'package:aiot/app/modules/home/views/home_view.dart';
import 'package:aiot/app/modules/server/server_model.dart';
import 'package:aiot/app/modules/server/views/add_view.dart';
import 'package:aiot/app/modules/tenant/bindings/tenant_binding.dart';
import 'package:aiot/app/modules/tenant/views/tenant_view.dart';
import 'package:aiot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import '../controllers/server_controller.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// https://www.jianshu.com/p/e74286d2e14c

class ServerView extends GetView<ServerController> {
  final ServerController c = Get.find();

  Widget getServerWidgets(List servers) {
    List<Widget> list = [];
    list.add(SizedBox(
      height: kDefaultPadding / 2,
    ));
    for (var server in servers) {
      list.add(ServerItem(
        server: server,
      ));
    }
    return Column(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(c.servers);
    return Material(
      child: Scaffold(
        body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            transitionBetweenRoutes: false,
            middle: Text('Server'),
            trailing: GestureDetector(
              child: Icon(Icons.add),
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
              child: Obx(() => getServerWidgets(c.servers)),
              // Column(
              //   children: [
              //     ServerItem(),
              //     // ServerItem(),
              //     // ServerItem(),
              //     ListTile(
              //       title: Text('Home'),
              //       leading: Icon(Icons.home),
              //       onTap: () {
              //         Get.to(
              //           HomeView(),
              //           binding: HomeBinding(),
              //         );
              //       },
              //     ),
              //     ListTile(
              //       title: Text('Tenant'),
              //       leading: Icon(Icons.account_circle),
              //       onTap: () {
              //         Get.to(TenantView(), binding: TenantBinding());
              //       },
              //     ),
              //     ListTile(
              //       title: Text('Dashboard'),
              //       leading: Icon(Icons.dashboard),
              //       onTap: () {
              //         Get.to(DashboardView(), binding: DashboardBinding());
              //       },
              //     ),
              //   ],
              // ),
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
  final Server server;
  const ServerItem({
    Key key,
    this.server,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowCard(
      onTap: () {
        final AuthController ac = Get.find();
        ac.login(server, (Error err, Rx<User> user) {
          print("#### $err---$user");
          if (err == null) {
            var hasTenant = false;
            for (PermissionList permissionList in user.value.permissionList) {
              if (permissionList.code == 'system') {
                for (Permissions permissions in permissionList.permissions) {
                  print(permissions.code);
                  if (permissions.code == 'system-tenant') {
                    hasTenant = true;
                  }
                }
              }
            }
            if (hasTenant) {
              Get.to(TenantView(), binding: TenantBinding());
            } else {
              Get.to(DashboardView(), binding: DashboardBinding());
            }
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: new Text("错误"),
                content: new Text("服务器连接失败！"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop(false),
                  )
                ],
              ),
            );
          }
        });
      },
      onLongPress: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) => CupertinoActionSheet(
            // title: const Text('Title'),
            // message: const Text('Message'),
            actions: [
              CupertinoActionSheetAction(
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  final ServerController sc = Get.find();
                  sc.removeServer(server);
                  Navigator.pop(context);
                },
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text(
                'Cancel',
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
      child: Container(
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
              child: Icon(
                Icons.dns_outlined,
                color: Colors.white,
                size: 24.0,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    server.alias,
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
                    server.ip,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xff91909a),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Container(
            //     child: Text(
            //       '+\$275,85',
            //       style: TextStyle(
            //         fontSize: 16,
            //         color: const Color(0xff4953ed),
            //       ),
            //       textAlign: TextAlign.right,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
