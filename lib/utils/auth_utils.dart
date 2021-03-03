import 'package:get_storage/get_storage.dart';

class AuthUtils {
  static AuthUtils _instance;

  final _box = GetStorage();
  final _key = 'accessToken';
  static AuthUtils getInstance() {
    if (_instance == null) {
      _instance = new AuthUtils();
    }
    return _instance;
  }

  saveToken(token) {
    _box.write(_key, token);
  }

  getToken() {
    return _box.read(_key);
  }

  // AuthUtils() {}
}
