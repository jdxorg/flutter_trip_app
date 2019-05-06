import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_trip_app/common/i10n/sys_string_base.dart';
import 'package:flutter_trip_app/common/i10n/sys_string_en.dart';
import 'package:flutter_trip_app/common/i10n/sys_string_zh.dart';

///自定义多语言实现
class DefaultLocalizations {
  final Locale locale;

  DefaultLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///GSYStringEn和GSYStringZh都继承了GSYStringBase
  static Map<String, SysStringBase> _localizedValues = {
    'en': new SysStringEn(),
    'zh': new SysStringZh(),
  };

  SysStringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 GSYLocalizations
  ///获取对应的 GSYStringBase
  static DefaultLocalizations of(BuildContext context) {
    return Localizations.of(context, DefaultLocalizations);
  }
}
