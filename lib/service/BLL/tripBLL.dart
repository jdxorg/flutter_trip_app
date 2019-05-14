import 'package:flutter_trip_app/entity/BannerEntity.dart';
import 'package:flutter_trip_app/entity/NavbarEntity.dart';

import '../api/trip_service.dart';
import 'package:flutter_trip_app/entity/BannerEntityList.dart';
import 'package:flutter_trip_app/entity/NavbarEntityList.dart';
class TripBLL {
  Future<Map> getHome() async {
    try {
      var result = await TripApi().getHome();
      BannerEntityList banners;
      NavbarEntityList navbars;
      if( result.result == true ){
        banners = new BannerEntityList.fromJson(result.data['banners']);
        navbars = new NavbarEntityList.fromJson(result.data['navbars']);
      }
      return {"banners":banners!=null?banners.banners.toList():new List<BannerEntity>(),"navbars":navbars!=null?navbars.navbars.toList():new List<NavbarEntity>()};
    } catch (error) {
      throw (error);
    }
  }
}
