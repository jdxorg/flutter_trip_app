/**
 * 通用逻辑
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/common/i10n/sys_string_base.dart';
import 'package:flutter_trip_app/common/i10n/default_localizations.dart';
class  CommonUtils {
  
  static getThemeData(Color color) {
    return ThemeData(primarySwatch: color, platform: TargetPlatform.android);
  }

  ///获取本地化设置
  static SysStringBase getLocale(BuildContext context) {
    return DefaultLocalizations.of(context).currentLocalized;
  }
  ///加载本地json文件
  static Future<String> loadJsonAsset(BuildContext context,String fileName) async {
    String jsonStr;
    try{
      jsonStr = await DefaultAssetBundle.of(context).loadString(fileName);
    }catch(error){
      throw (error);
    }
    return jsonStr;
  }
}