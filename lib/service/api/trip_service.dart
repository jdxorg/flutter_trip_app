import '../config/api_trip.dart';
import 'package:flutter_trip_app/utils/http_utils.dart';
class TripApi{
  ///获取banner
  Future<Map> getBanner() {
    try{
      return HttpUtils.request(TripApiConfig.banner);
    }catch(error){
      throw(error);
    }
  }
  ///获取导航
  Future<Map> getNavbar() {
    try{
      return HttpUtils.request(TripApiConfig.navbar); 
    }catch(error){
      throw(error);
    }
  }
}