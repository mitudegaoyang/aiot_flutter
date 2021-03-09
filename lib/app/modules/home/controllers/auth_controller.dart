import 'package:aiot/app/modules/server/server_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:aiot/app/modules/home/providers/auth_provider.dart';
import 'package:aiot/config.dart';

import '../user_model.dart';

class AuthController extends GetxController {
  final _box = GetStorage();
  final _key = 'accessToken';
  AuthController({this.authProvider});

  final AuthProvider authProvider;

  final count = 0.obs;
  final user = User().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void login(Server server, Function cb) {
    authProvider.login(
        {"identity": server.identity, "password": server.password},
        server.ip).then((data) {
      if (data.body.accessToken != null) {
        _box.write(_key, data.body.accessToken);
        _box.write("IP", server.ip);
        authProvider.touch(server.ip).then((data) {
          user.value = data.body;
          cb(null, user);
        }, onError: (err) {
          cb(err, null);
        });
      } else {
        cb(Error(), null);
      }
    }, onError: (err) {
      cb(err, null);
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
