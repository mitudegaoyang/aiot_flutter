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
    authProvider.login({
      "identity": CloudConfig.tmpUsername,
      "password": CloudConfig.tmpPassword
    }).then((data) {
      _box.write(_key, data.body.accessToken);
      authProvider.touch().then((data) {
        user.value = data.body;
        // print(data.body.name);
      });
    }, onError: (err) {
      print(err);
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
