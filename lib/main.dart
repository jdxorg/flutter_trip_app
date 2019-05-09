import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_trip_app/common/i10n/localizations_delegate.dart';
import 'package:flutter_trip_app/pages/main_page.dart';
import 'package:flutter_trip_app/utils/common_utils.dart';
import 'package:flutter_trip_app/common/ui/sys_toast.dart';
import 'package:flutter/rendering.dart';

void main(){
  // debugPaintSizeEnabled=true;
  runApp(MyApp());
  if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WillPopScopeTestRoute(),
      //多语言实现代理
      localizationsDelegates: [
        AppLocalizationsDelegate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('zh', 'CH'),
      ],
    );
  }
}

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt; //上次点击时间
  var status = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        return status = true;
      },
      child: WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
              SysToast.showToast(CommonUtils.getLocale(context).double_click_exit);
            _lastPressedAt = DateTime.now();//两次点击间隔超过1秒则重新计时
            return false;
          }
          return true;
        },
        child: MainPage(),
      ),
    );
  }
}
