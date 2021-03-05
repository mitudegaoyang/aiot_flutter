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
            SearchBar(),
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: c.tenantlist.value.data == null
                        ? 0
                        : c.tenantlist.value.data.length,
                    itemBuilder: (context, index) {
                      final tenant = c.tenantlist.value.data[index];
                      return _buildRow(tenant);
                    })))
          ],
        ),
      ),
    );
  }
}
