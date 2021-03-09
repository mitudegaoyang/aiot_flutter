import 'package:aiot/app/modules/server/controllers/server_controller.dart';
import 'package:aiot/app/modules/server/server_model.dart';
import 'package:aiot/constant.dart';
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
    final ServerController c = Get.find();
    var data = {
      "name": _name,
      "ip": _ip,
      "account": _account,
      "password": _password
    };
    var server = Server.fromJson({
      "alias": _name,
      "ip": _ip,
      "identity": _account,
      "password": _password
    });
    print(server.alias);
    c.addServer(server);
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
            // height: 360,
            child: Column(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color(0xffD1D1D1),
                          style: BorderStyle.solid,
                          width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _handleCancel();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      TextButton(
                        onPressed: _forSubmitted,
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: kDefaultPadding / 2,
                      left: kDefaultPadding,
                      right: kDefaultPadding),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                          decoration: kInputDecoration('Name'),
                          onSaved: (val) {
                            _name = val;
                          }),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      TextFormField(
                          decoration: kInputDecoration('Ip'),
                          onSaved: (val) {
                            _ip = val;
                          }),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      TextFormField(
                          decoration: kInputDecoration('Account'),
                          onSaved: (val) {
                            _account = val;
                          }),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      TextFormField(
                          obscureText: !showPwd,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              filled: true,
                              fillColor: Color(0xFFF5F6FA),
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 20),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Color(0xffC1C0C8),
                              ),
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
                    ]),
                  ),
                  // decoration: BoxDecoration(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
