import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_trip_app/common/i10n/localizations_delegate.dart';
import 'package:flutter_trip_app/pages/index.dart';

import 'package:flutter_trip_app/pages/tabs/home_page.dart';
// import 'package:flutter_trip_app/pages/tabs/travel_page.dart';
// import 'package:flutter_trip_app/pages/tabs/photo_page.dart';
// import 'package:flutter_trip_app/pages/tabs/customer_page.dart';
// import 'package:flutter_trip_app/pages/tabs/my_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
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
      // routes:{
      //   MyHomePage.sName: (context) {
      //     return MyHomePage();
      //   },
      //   MyTravelPage.sName: (context) {
      //     return MyTravelPage();
      //   },
      //   MyPhotoPage.sName: (context) {
      //     return MyPhotoPage();
      //   },
      //   MyCustomer.sName: (context) {
      //     return MyCustomer();
      //   },
      //   MyPage.sName: (context) {
      //     return MyPage();
      //   },
      // },
    );
  }
}
