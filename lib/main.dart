import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_trip_app/common/i10n/localizations_delegate.dart';
import 'package:flutter_trip_app/pages/main_page.dart';
import 'package:flutter_trip_app/utils/common_utils.dart';
import 'package:flutter_trip_app/utils/ui/sys_toast.dart';
import 'package:flutter_trip_app/utils/net/error_event.dart';
import 'package:flutter_trip_app/utils/net/code.dart';
Future<Null> main() async {
  bool isInDebugMode = false;
  // debugPaintSizeEnabled=true;
  // This captures errors reported by the Flutter framework
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
       // In development mode simply print to console
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone
      // 重定向到 runZone 中处理
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
 
  runZoned<Future<Null>>(() async {
    runApp(new MyApp());
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }, onError: (error, stackTrace) async {
    ///通过channel调用native方法，把error栈的信息传的native中
    // await _reportError(error, stackTrace);
  });
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
  StreamSubscription stream;
  DateTime _lastPressedAt; //上次点击时间
  var status = false;

  @override
  void initState(){
    super.initState();
    stream = Code.eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }
  @override
  void dispose() {
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
    super.dispose();
  }
  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        SysToast.showToast(message: CommonUtils.getLocale(context).network_error);
        break;
      case 401:
        SysToast.showToast(message: CommonUtils.getLocale(context).network_error_401);
        break;
      case 403:
        SysToast.showToast(message: CommonUtils.getLocale(context).network_error_403);
        break;
      case 404:
        SysToast.showToast(message: CommonUtils.getLocale(context).network_error_404);
        break;
      case Code.NETWORK_TIMEOUT:
        //超时
        SysToast.showToast(message: CommonUtils.getLocale(context).network_error_timeout);
        break;
      default:
        SysToast.showToast(message: CommonUtils.getLocale(context).network_error_unknown + " " + message);
        break;
    }
  }
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
              SysToast.showToast(message:CommonUtils.getLocale(context).double_click_exit);
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
