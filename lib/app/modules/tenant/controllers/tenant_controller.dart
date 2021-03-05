import 'package:aiot/app/modules/tenant/providers/tenant_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../tenant_model.dart';

class TenantController extends GetxController {
  TenantController({this.tenantProvider, authProvider});

  final TenantProvider tenantProvider;

  ScrollController _scrollController = new ScrollController();

  final count = 0.obs;
  final tenantlist = TenantList().obs;

  @override
  void onInit() {
    super.onInit();
    //租户列表
    tenantProvider.getTenants().then((data) {
      tenantlist.value = data.body;
    }, onError: (err) {
      print(err);
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        // if (pageno < totalPages - 1) {
        //   pageno++;
        //   // print('加载更多 pageno:' + pageno.toString());
        //   // 加载更多
        //   setState(() {
        //     isLoading = true;
        //   });
        //   _getMoreData();
        // } else {
        //   // 没有更多了
        //   showToast("没有更多了");
        // }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
