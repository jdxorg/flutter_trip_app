/**
 * 首页
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/pages/widget/home/banner.dart';
import 'package:flutter_trip_app/pages/widget/home/menu.dart';
import 'package:flutter_trip_app/entity/BannerEntity.dart';
import 'package:flutter_trip_app/entity/NavbarEntity.dart';
import 'package:flutter_trip_app/service/BLL/tripBLL.dart';

class MyHomePage extends StatefulWidget {
  static final String sName = 'home';

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _futureBuilderFuture;

  Future load() async {
    try {
      return await TripBLL().getHome();
    } catch (error) {
      throw (error);
    }
  }

  @override
  void initState() {
    super.initState();

    ///用_futureBuilderFuture来保存load()的结果，以避免不必要的ui重绘
    _futureBuilderFuture = load();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        padding: const EdgeInsets.only(top: 0.0),
        children: <Widget>[
          FutureBuilder(
            future: _futureBuilderFuture,
            builder: _buildFuture,
          ),
          HomeMenu()
        ],
      ),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('ConnectionState.none');
        return null;
      case ConnectionState.active:
        print('ConnectionState.active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('ConnectionState.waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('ConnectionState.done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        Map map = snapshot.data;
        List<BannerEntity> _banners = map['banners'];
        List<NavbarEntity> _navbars = map['navbars'];
        return buildBanner(context, banners: _banners, navbars: _navbars);
      default:
        return null;
    }
  }
}
