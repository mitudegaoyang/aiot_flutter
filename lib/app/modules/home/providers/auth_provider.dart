import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:aiot/app/modules/home/user_model.dart';
import 'package:aiot/config.dart';

import '../auth_model.dart';

class AuthProvider extends GetConnect {
  final _box = GetStorage();
  final _key = 'accessToken';

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Auth.fromJson(map);
    httpClient.baseUrl = CloudConfig.baseUrl;
  }

  Future<Response<Auth>> login(data) async => await post('/login', data);
  Future<Response<User>> touch() async => await get('/me/info',
      headers: {"Authorization": _box.read(_key)},
      decoder: (map) => User.fromJson(map));
}
