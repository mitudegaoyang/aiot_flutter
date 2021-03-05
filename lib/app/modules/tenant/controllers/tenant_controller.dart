import 'package:aiot/app/modules/tenant/providers/tenant_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../tenant_model.dart';

class TenantController extends GetxController {
  TenantController({this.tenantProvider, authProvider});

  final TenantProvider tenantProvider;

  ScrollController scrollController = new ScrollController();

  final isLoading = true.obs;
  final hasMore = true.obs;
  // 总页数
  // int totalPages = 1;
  final totalPages = 1.obs;
  // 当前页数
  final pageIndex = 1.obs;

  final count = 0.obs;
  final tenantlist = TenantList().obs;

  List<Tenant> tmpList = new List(); //临时存储租户列表
  @override
  void onInit() {
    super.onInit();
    _getMoreData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        isLoading.value = true;
        _getMoreData();
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
  void onClose() {
    scrollController.dispose();
  }

  void increment() => count.value++;

  void _getMoreData() async {
    if (isLoading != null) {
      tenantProvider.getTenants(pageIndex.value).then(
        (data) {
          tenantlist.value = data.body;
          tmpList.addAll(data.body.data);
          tenantlist.value.data = tmpList;
          pageIndex.value = data.body.pageIndex + 1;
          // int totalPages = ((data.body.totalRecords + 8 - 1) / 8) as int; //推荐写法
          // totalPages.value = totalPages;
          Future.delayed(const Duration(milliseconds: 3000), () {
            isLoading.value = false;
          });
          // isLoading.value = false;
        },
        onError: (err) {
          isLoading.value = false;
          print(err);
        },
      );
    }
  }
}
