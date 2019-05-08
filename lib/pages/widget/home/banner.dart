import 'package:flutter/material.dart';
import 'package:flutter_trip_app/widget/swiper_widget.dart';
import 'package:flutter_trip_app/widget/search_bar_widget.dart';
import 'package:flutter_trip_app/pages/widget/home/navbar.dart';
import 'package:flutter_trip_app/common/constraints/sys_icons.dart';
import 'package:flutter_trip_app/common/constraints/sys_style.dart';
import 'package:flutter_trip_app/entity/BannerEntity.dart';
import 'package:flutter_trip_app/entity/NavbarEntity.dart';

class HomeBanner extends StatelessWidget {
  final List<BannerEntity> banners;
  final List<NavbarEntity> navbars;
  HomeBanner({this.banners, this.navbars});
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        SwiperWidget(
          banners,
          paginationMargin: const EdgeInsets.fromLTRB(0, 0, 20, 60),
          onItemTap: (index) => print('$index'),
        ),
        Positioned(
          //设置子元素
          child: Text(
            '深圳',
            style: TextStyle(
              color: Color(SysStyle.white),
              fontSize: 18,
            ),
          ),
          //设置定位，
          top: 36.0,
          left: 10.0,
        ),
        Positioned(
          child: Icon(
            SysIcons.JianTou_Down,
            color: Color(SysStyle.white),
            size: 26,
          ),
          top: 36.0,
          left: 45.0,
        ),
        Positioned(
          left: 75.0,
          right: 60.0,
          top: 30.0,
          child: SearchBarWidget(),
        ),
        Positioned(
          right: 20.0,
          top: 36.0,
          child: Icon(
            SysIcons.MESSAGE,
            color: Color(SysStyle.white),
          ),
        ),
        Positioned(
          top: 100.0,
          child: HomeNavBar(navbars),
        ),
      ],
    );
  }
}
