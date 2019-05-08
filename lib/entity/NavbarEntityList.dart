import 'package:flutter_trip_app/entity/NavbarEntity.dart';

class NavbarEntityList {
  List<NavbarEntity> navbars;
  NavbarEntityList({this.navbars});

  factory NavbarEntityList.fromJson(List<dynamic> json) {
    List<NavbarEntity> navbars =
        json.map((i) => NavbarEntity.fromJson(i)).toList();
    return new NavbarEntityList(navbars: navbars);
  }
}
