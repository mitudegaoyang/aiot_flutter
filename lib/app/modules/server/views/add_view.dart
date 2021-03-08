import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  bool showPwd = true;
  void changeShowPwd() {
    setState(() {
      if (showPwd) {
        showPwd = false;
      } else {
        showPwd = true;
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  String _name;
  String _ip;
  String _account;
  String _password;
  void _forSubmitted() {
    var _form = _formKey.currentState;
    _form.save();
    var data = {
      "name": _name,
      "ip": _ip,
      "account": _account,
      "password": _password
    };
    print(data);
    Navigator.pop(context);
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 360,
            child: Column(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffD1D1D1),
                              style: BorderStyle.solid,
                              width: 1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            _handleCancel();
                          },
                          child: Text(
                            "取消",
                            style: TextStyle(fontSize: 20),
                          )),
                      TextButton(
                          onPressed: _forSubmitted,
                          child: Text(
                            "保存",
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  ),
                ),
                Container(
                  width: Get.width - 48,
                  margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                          decoration: InputDecoration(
                            hintText: '请输入别名',
                            filled: true,
                            fillColor: Color(0xFFF5F6FA),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            hintStyle: TextStyle(color: Color(0xffC1C0C8)),
                          ),
                          onSaved: (val) {
                            _name = val;
                          }),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '请输入ip',
                              filled: true,
                              fillColor: Color(0xFFF5F6FA),
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              hintStyle: TextStyle(color: Color(0xffC1C0C8)),
                            ),
                            onSaved: (val) {
                              _ip = val;
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '请输入账号',
                              filled: true,
                              fillColor: Color(0xFFF5F6FA),
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              hintStyle: TextStyle(color: Color(0xffC1C0C8)),
                            ),
                            onSaved: (val) {
                              _account = val;
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                            obscureText: !showPwd,
                            decoration: InputDecoration(
                                hintText: '请输入密码',
                                filled: true,
                                fillColor: Color(0xFFF5F6FA),
                                contentPadding:
                                    EdgeInsets.only(left: 20, right: 20),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                hintStyle: TextStyle(color: Color(0xffC1C0C8)),
                                suffixIcon: Container(
                                    child: GestureDetector(
                                  onTap: () {
                                    print(showPwd);
                                    changeShowPwd();
                                  },
                                  child: showPwd
                                      ? Icon(
                                          Icons.remove_red_eye,
                                          color: Color(0xFFC1C0C8),
                                        )
                                      : new SvgPicture.asset(
                                          'assets/icons/preview.svg',
                                          fit: BoxFit.scaleDown,
                                        ),
                                ))),
                            onSaved: (val) {
                              _password = val;
                            }),
                      ),
                    ]),
                  ),
                  // decoration: BoxDecoration(color: Colors.white),
                )
              ],
            ),
          )
          // ListTile(
          //   title: Text('Edit'),
          //   leading: Icon(Icons.edit),
          //   onTap: () => Navigator.of(context).pop(),
          // ),
          // ListTile(
          //   title: Text('Copy'),
          //   leading: Icon(Icons.content_copy),
          //   onTap: () => Navigator.of(context).pop(),
          // ),
          // ListTile(
          //   title: Text('Cut'),
          //   leading: Icon(Icons.content_cut),
          //   onTap: () => Navigator.of(context).pop(),
          // ),
          // ListTile(
          //   title: Text('Move'),
          //   leading: Icon(Icons.folder_open),
          //   onTap: () => Navigator.of(context).pop(),
          // ),
          // ListTile(
          //   title: Text('Delete'),
          //   leading: Icon(Icons.delete),
          //   onTap: () => Navigator.of(context).pop(),
          // )
        ],
      ),
    ));
  }
}
