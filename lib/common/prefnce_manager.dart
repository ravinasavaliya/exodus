import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage getStorage = GetStorage();

  static Future setIsLogin({String? value}) async {
    await getStorage.write("isLogin", value);
  }

  static getIsLogin() {
    return getStorage.read("isLogin");
  }

  static clear() {
    getStorage.remove('user_id');
  }
}
