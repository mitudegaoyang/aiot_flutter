import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../components/search_bar/search_bar.dart';
import '../../../../utils/screen_utils.dart';
import '../controllers/tenant_controller.dart';

class TenantView extends GetView<TenantController> {
  List<Widget> _getData() {
    List<Widget> list = new List();
    const data = [
      {"id": 1, "userName": "user1", "email": "user1@sunseaaiot.com"},
      {"id": 2, "userName": "user2", "email": "user2@sunseaaiot.com"},
      {"id": 3, "userName": "user3", "email": "user3@sunseaaiot.com"},
    ];
    for (var i = 0; i < data.length; i++) {
      list.add(listItem(data[i]));
    }
    return list;
  }

  Widget listItem(itemData) {
    print(itemData);
    return Container(
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(16)),
      child: Row(
        children: [
          Container(
            width: getProportionateScreenWidth(52),
            height: getProportionateScreenHeight(52),
            decoration: BoxDecoration(
                color: Colors.red,
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
                      itemData['userName'],
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
                    child: Text(itemData['email'],
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
                child: ListView(
              children: _getData(),
            ))
          ],
        ),
      ),
    );
  }
}
