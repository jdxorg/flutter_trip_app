/**
 * 首页
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/pages/widget/home/banner.dart';
import 'package:flutter_trip_app/entity/BannerEntity.dart';
import 'package:flutter_trip_app/entity/NavbarEntity.dart';
import 'package:flutter_trip_app/service/BLL/tripBLL.dart';

class MyHomePage extends StatefulWidget {
  static final String sName = 'home';

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<BannerEntity> _banners = [];
  List<NavbarEntity> _navbars = [];

  Future load() async {
    try {
      List<BannerEntity> bannerEntityList = await TripBLL().getBanner();

      // List<NavbarEntity> navbarEntityList = await TripBLL().getNavbar();
      if (!mounted) return;
      setState(() {
        _banners = bannerEntityList;
        // _navbars = navbarEntityList;
      });
    } catch (error) {
      throw (error);
    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        padding: const EdgeInsets.only(top: 0.0),
        children: <Widget>[
          HomeBanner(banners: _banners, navbars: _navbars),
        ],
      ),
    );
  }
}
