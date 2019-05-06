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

  static SysStringBase getLocale(BuildContext context) {
    return DefaultLocalizations.of(context).currentLocalized;
  }
}