/**
 * 首页
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/pages/widget/home/banner.dart';
import 'package:flutter_trip_app/pages/widget/home/menu.dart';
import 'package:flutter_trip_app/pages/widget/home/sub_menu.dart';
import 'package:flutter_trip_app/pages/widget/home/special.dart';
import 'package:flutter_trip_app/entity/BannerEntity.dart';
import 'package:flutter_trip_app/entity/NavbarEntity.dart';
import 'package:flutter_trip_app/service/BLL/tripBLL.dart';
import 'package:flutter_trip_app/common/constraints/sys_style.dart';
import 'package:flutter_trip_app/utils/log/log.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_trip_app/redux/app_state.dart';
class MyHomePage extends StatefulWidget {
  static final String sName = 'home';

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {
  var _futureBuilderFuture;

  Future load() async {
    var ret;
    try {
      ret = await TripBLL().getHome();
    } catch (error) {
      throw (error);
    }
    return ret;
  }
  @override
  bool get wantKeepAlive => true;
  
  @override
  void initState() {
    super.initState();
    ///用_futureBuilderFuture来保存load()的结果，以避免不必要的ui重绘
    _futureBuilderFuture = load();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color(SysStyle.mainBackground),
      child: ListView(
        padding: const EdgeInsets.only(top: 0.0),
        children: <Widget>[
          FutureBuilder(
            future: _futureBuilderFuture,
            builder: _buildFuture,
          ),
          HomeMenu(),
          SubMenu(),
          Special(),
        ],
      ),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        // LogUtils.i('ConnectionState.none');
        return null;
      case ConnectionState.active:
        // LogUtils.i('ConnectionState.active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        // LogUtils.i('ConnectionState.waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        // LogUtils.i('ConnectionState.done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        var map = snapshot.data;
        List<BannerEntity> _banners = map['banners'];
        List<NavbarEntity> _navbars = map['navbars'];
        return buildBanner(context, banners: _banners, navbars: _navbars);
      default:
        return null;
    }
  }
}
