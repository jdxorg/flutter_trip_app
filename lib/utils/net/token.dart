import 'package:flutter_trip_app/common/constraints/sys_config.dart';
import '../local/local_storage.dart';
class Token{
  ///清除授权
  static Future clearAuthorization() async {
    return LocalStorage.remove(SysConfig.TOKEN_KEY);
  }

  ///获取授权token
  static Future<String> getAuthorization() async {
    String token = await LocalStorage.get(SysConfig.TOKEN_KEY);
    if (token == null) {
      //提示输入账号密码
      return null;
    } else {
      return token;
    }
  }
}