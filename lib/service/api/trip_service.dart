import '../config/api_trip.dart';
import 'package:flutter_trip_app/utils/net/http.dart';
import 'package:flutter_trip_app/utils/net/result_data.dart';
class TripApi{
  ///获取banner
  Future<ResultData> getHome() {
    try{
      return HttpUtils.request(TripApiConfig.home,data: {"name":'123'},queryParameters: 'id=1');
    }catch(error){
      throw(error);
    }
  }
}