import 'package:aiot/app/modules/tenant/tenant_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../components/search_bar/search_bar.dart';
import '../../../../utils/screen_utils.dart';
import '../controllers/tenant_controller.dart';

class TenantView extends GetView<TenantController> {
  final TenantController c = Get.find();

  Widget _buildRow(Tenant item) {
    return Container(
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(16)),
      child: Row(
        children: [
          Container(
            width: getProportionateScreenWidth(52),
            height: getProportionateScreenHeight(52),
            decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(
                    'assets/images/avatar.png',
                  ),
                  fit: BoxFit.contain,
                ),
                // color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(52))),
          ),
          Container(
            child: Expanded(
                child: Container(
              margin: EdgeInsets.only(
                left: getProportionateScreenWidth(16),
              ),
              padding: EdgeInsets.only(
                  bottom: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(0xffD1D1D1),
                          style: BorderStyle.solid,
                          width: 1))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: getProportionateScreenWidth(6)),
                    child: Text(
                      item.name,
                      style: TextStyle(
                        fontFamily: 'Avenir-Heavy',
                        fontSize: 16,
                        color: const Color(0xff02010e),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenWidth(10),
                    ),
                    child: Text(item.adminUserIdentity,
                        style: TextStyle(
                          fontFamily: 'Avenir-Roman',
                          fontSize: 14,
                          color: const Color(0xff91909a),
                        )),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return Obx(() {
      int len =
          c.tenantlist.value.data == null ? 0 : c.tenantlist.value.data.length;
      return ListView.builder(
          controller: c.scrollController,
          itemCount: len + 1,
          itemBuilder: (context, index) {
            if (index == len) {
              return _buildProgressIndicator();
            }
            final tenant = c.tenantlist.value.data[index];
            return _buildRow(tenant);
            // if (tenant != null) {
            //   return _buildRow(tenant);
            // } else {
            //   return Text("");
            // }
          });
    });
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: Obx(() {
          int len = c.tenantlist.value.data == null
              ? 0
              : c.tenantlist.value.data.length;
          // print("${c.tenantlist.value.totalRecords}-----$len");
          if (len == c.tenantlist.value.totalRecords) {
            return Text("没有更多了");
          } else {
            return new Opacity(
              opacity: c.isLoading.value ? 1.0 : 00,
              child: SizedBox(
                height: 30,
                width: 30,
                child: new CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: Container(
        padding: EdgeInsets.only(
            top: getProportionateScreenWidth(50),
            left: getProportionateScreenWidth(28),
            right: getProportionateScreenWidth(28)),
        decoration: BoxDecoration(),
        child: Column(
          children: [
            SearchBar(onSearch: c.onSearch, onCancel: c.onCancelSearch),
            Expanded(
                child: RefreshIndicator(
              onRefresh: c.onRefresh,
              child: _buildList(),
            ))
          ],
        ),
      ),
    );
  }
}
