/**
 * 首页
 */
import 'dart:io';
import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/pages/tabs/home_page.dart';
import 'package:flutter_trip_app/utils/common_utils.dart';
import 'package:flutter_trip_app/common/constraints/sys_icons.dart';
import 'package:flutter_trip_app/common/constraints/sys_colors.dart';

import 'package:flutter_trip_app/widget/bottom_tabbar_widget.dart';
import 'package:flutter_trip_app/widget/titlebar_widget.dart';

//pages
import 'package:flutter_trip_app/pages/tabs/customer_page.dart';
import 'package:flutter_trip_app/pages/tabs/my_page.dart';
import 'package:flutter_trip_app/pages/tabs/photo_page.dart';
import 'package:flutter_trip_app/pages/tabs/travel_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);
  /// 不退出
  Future<bool> _dialogExitApp(BuildContext context) async {
    if (Platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: "android.intent.category.HOME",
      );
      await intent.launch();
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> tabs = [
      BottomNavigationBarItem( icon: Icon(SysIcons.HOME), title: Text(CommonUtils.getLocale(context).home_tab)),
      BottomNavigationBarItem( icon: Icon(SysIcons.TRAVEL), title: Text(CommonUtils.getLocale(context).travel_tab)),
      BottomNavigationBarItem( icon: Icon(SysIcons.PHOTO), title: Text(CommonUtils.getLocale(context).photo_tab)),
      BottomNavigationBarItem( icon: Icon(SysIcons.CUSTOMER), title: Text(CommonUtils.getLocale(context).customer_tab)),
      BottomNavigationBarItem( icon: Icon(SysIcons.MY), title: Text(CommonUtils.getLocale(context).my_tab)),
    ];
    
    return WillPopScope(
      onWillPop: (){
        return _dialogExitApp(context);
      },
      child: new BottomTabBarWidget(
        tabItems: tabs,
        tabViews:[
          new MyHomePage(),
          new MyTravelPage(),
          new MyPhotoPage(),
          new MyCustomer(),
          new MyPage(),
        ],
        // backgroundColor: SysColors.primarySwatch,
        // indicatorColor: Color(SysColors.white),
        // title: TitleBar(
        //   CommonUtils.getLocale(context).app_name,
        //   iconData: SysIcons.HOME,
        //   needRightLocalIcon: true,
        //   onPressed: (){
        //     print('navigate');
        //   },
        // ),
      ),
    );
  }
}
