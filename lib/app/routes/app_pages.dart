import 'package:get/get.dart';

import 'package:aiot/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:aiot/app/modules/dashboard/views/dashboard_view.dart';
import 'package:aiot/app/modules/home/bindings/home_binding.dart';
import 'package:aiot/app/modules/home/views/home_view.dart';
import 'package:aiot/app/modules/tenant/bindings/tenant_binding.dart';
import 'package:aiot/app/modules/tenant/views/tenant_view.dart';

part 'app_routes.dart';

class AppPages {
  // static const INITIAL = Routes.DASHBOARD;
  // static const INITIAL = Routes.TENANT;
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TENANT,
      page: () => TenantView(),
      binding: TenantBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
