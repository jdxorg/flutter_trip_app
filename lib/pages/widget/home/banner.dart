import 'package:flutter/material.dart';
import 'package:flutter_trip_app/widget/swiper_widget.dart';
import 'package:flutter_trip_app/pages/widget/home/navbar.dart';
import 'package:flutter_trip_app/entity/BannerEntity.dart';
import 'package:flutter_trip_app/entity/NavbarEntity.dart';

Widget buildBanner(BuildContext context,
    {List<BannerEntity> banners, List<NavbarEntity> navbars}) {
  const double swiperHeight = 240;
  return new Stack(
    overflow: Overflow.visible,
    children: <Widget>[
      new SwiperWidget(
        height: swiperHeight,
        imageList: banners,
        paginationMargin: const EdgeInsets.fromLTRB(0, 0, 20, 60),
        onItemTap: (index) => {},
      ),
      Positioned(
        top: swiperHeight - 50,
        left: 15.0,
        right: 15.0,
        child: buildNavbar(context, navbars: navbars),
      ),
    ],
  );
}
