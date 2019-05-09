import '../config/api_trip.dart';
import 'package:flutter_trip_app/utils/http_utils.dart';
class TripApi{
  ///获取banner
  Future<Map> getHome() {
    try{
      return HttpUtils.request(TripApiConfig.home);
    }catch(error){
      throw(error);
    }
  }
}