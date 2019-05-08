import '../api/trip_service.dart';
import 'package:flutter_trip_app/entity/BannerEntityList.dart';
import 'package:flutter_trip_app/entity/NavbarEntityList.dart';
class TripBLL{
  Future<BannerEntityList> getBanner() async {
    try{
      var data = await TripApi().getBanner();
      BannerEntityList list = new BannerEntityList.fromJson(data);
      return list;
    }catch(error){
      throw(error);
    }
  }
  Future<NavbarEntityList> getNavbar() async {
    try{
      var data = await TripApi().getNavbar();
      NavbarEntityList list = new NavbarEntityList.fromJson(data);
      return list;
    }catch(error){
      throw(error);
    }
  }
}