/**
 * 首页
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/pages/tabs/home_page.dart';
import 'package:flutter_trip_app/utils/common_utils.dart';
import 'package:flutter_trip_app/common/constraints/sys_icons.dart';
//pages
import 'package:flutter_trip_app/pages/tabs/customer_page.dart';
import 'package:flutter_trip_app/pages/tabs/my_page.dart';
import 'package:flutter_trip_app/pages/tabs/photo_page.dart';
import 'package:flutter_trip_app/pages/tabs/travel_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_trip_app/redux/app_state.dart';

class MainPage extends StatefulWidget {
  static final String sName='index';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);
  
// bottomnaviagtionbar 和 pageview 的联动
  void onTap(int index) {
    // 过pageview的pagecontroller的animateToPage方法可以跳转
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );

  }

  void _pageChange(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
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
    List<Widget> pages = [
      new MyHomePage(),
      new MyTravelPage(),
      new MyPhotoPage(),
      new MyCustomer(),
      new MyPage(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _pageChange,
        children: pages,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: tabs,
        currentIndex: _currentPageIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        iconSize: 24.0,
      ),
      floatingActionButton: new StoreConnector<AppState,VoidCallback>(builder: ( BuildContext context,VoidCallback callback ){
        return new FloatingActionButton(
          onPressed:callback,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        );
      }, converter: (Store<AppState> store){
        return ()=>store.dispatch(Actions.Increment);
      }),
    );
  }
}
