import 'package:aiot/app/modules/tenant/providers/tenant_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../tenant_model.dart';

class TenantController extends GetxController {
  TenantController({this.tenantProvider, authProvider});

  final TenantProvider tenantProvider;

  ScrollController scrollController = new ScrollController();

  final isLoading = true.obs;
  // 总页数
  // final totalPages = 1.obs;
  // 当前页数
  final pageIndex = 1.obs;

  final tenantName = "".obs;

  final tenantlist = TenantList().obs;

  List<Tenant> tmpList = new List(); //临时存储租户列表
  @override
  void onInit() {
    super.onInit();
    _getMoreData();

    //上拉加载更多
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // print('滑动到了最底部');
        isLoading.value = true;
        if (tmpList.length == tenantlist.value.totalRecords) {
          print("没有更多了");
        } else {
          _getMoreData();
        }
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

  void _getMoreData() async {
    if (isLoading != null) {
      print(pageIndex.value);
      tenantProvider.getTenants(pageIndex.value, tenantName.value).then(
        (data) {
          tenantlist.value = data.body;
          tmpList.addAll(data.body.data);
          tenantlist.value.data = tmpList;
          pageIndex.value = data.body.pageIndex + 1;
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

//下拉刷新
  Future<void> onRefresh() async {
    tmpList.clear();
    isLoading.value = true;
    pageIndex.value = 1;
    _getMoreData();
  }

  Future<void> onSearch(String name) async {
    tenantName.value = name;
    tmpList.clear();
    isLoading.value = true;
    pageIndex.value = 1;
    _getMoreData();
  }

  Future<void> onCancelSearch() async {
    tenantName.value = "";
    tmpList.clear();
    isLoading.value = true;
    pageIndex.value = 1;
    _getMoreData();
  }
}
