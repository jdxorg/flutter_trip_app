import '../api/trip_service.dart';
import 'package:flutter_trip_app/entity/BannerEntityList.dart';
import 'package:flutter_trip_app/entity/NavbarEntityList.dart';
class TripBLL {
  Future<Map> getHome() async {
    try {
      var data = await TripApi().getHome();
      BannerEntityList banners = new BannerEntityList.fromJson(data['banners']);
      NavbarEntityList navbars = new NavbarEntityList.fromJson(data['navbars']);
      return {"banners":banners.banners.toList(),"navbars":navbars.navbars.toList()};
    } catch (error) {
      throw (error);
    }
  }
}
