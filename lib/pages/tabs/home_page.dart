/**
 * 首页
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/pages/widget/home/banner.dart';
import 'package:flutter_trip_app/entity/BannerEntityList.dart';
import 'package:flutter_trip_app/entity/NavbarEntityList.dart';
import 'package:flutter_trip_app/service/BLL/tripBLL.dart';

class MyHomePage extends StatefulWidget {
  static final String sName = 'home';

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerEntityList _bannerEntityList;
  NavbarEntityList _navbarEntityList;
  Future load() async {
    try{
       
      BannerEntityList bannerEntityList = await TripBLL().getBanner();

      NavbarEntityList navbarEntityList = await TripBLL().getNavbar();
      setState(() {
        _bannerEntityList = bannerEntityList;
        _navbarEntityList = navbarEntityList;
      });
    }catch(error){
      return null;
    }
  }
  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        padding: const EdgeInsets.only(top: 0.0),
        children: <Widget>[
          HomeBanner(_bannerEntityList.banners,_navbarEntityList.navbars),
        ],
      ),
    );
  }
}
