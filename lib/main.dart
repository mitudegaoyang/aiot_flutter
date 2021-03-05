import 'package:aiot/app/modules/server/bindings/server_binding.dart';
import 'package:aiot/db.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:aiot/config.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final directory = await getApplicationDocumentsDirectory();
  // print(directory);
  await GetDb.init();
  await GetStorage.init();
  await CloudConfig.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ServerBinding(),
      title: "Application",
      theme: ThemeData(platform: TargetPlatform.iOS),
      initialRoute: AppPages.INITIAL,
      onGenerateRoute: AppPages.onGenerateRoute,
      // getPages: AppPages.routes,
    );
  }
}
