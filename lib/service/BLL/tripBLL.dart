import '../api/trip_service.dart';
import 'package:flutter_trip_app/entity/BannerEntityList.dart';
import 'package:flutter_trip_app/entity/NavbarEntityList.dart';
import 'package:flutter_trip_app/entity/NavbarEntity.dart';
import 'package:flutter_trip_app/entity/BannerEntity.dart';

class TripBLL {
  Future<List<BannerEntity>> getBanner() async {
    try {
      var data = await TripApi().getBanner();
      BannerEntityList list = new BannerEntityList.fromJson(data['_root_']);
      return list.banners;
    } catch (error) {
      throw (error);
    }
  }

  Future<List<NavbarEntity>> getNavbar() async {
    try {
      var data = await TripApi().getNavbar();
      NavbarEntityList list = new NavbarEntityList.fromJson(data['_root_']);
      return list.navbars;
    } catch (error) {
      throw (error);
    }
  }
}
