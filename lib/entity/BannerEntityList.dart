import 'package:flutter_trip_app/entity/BannerEntity.dart';

class BannerEntityList {
  List<BannerEntity> banners;
  BannerEntityList({this.banners});

  factory BannerEntityList.fromJson(List<dynamic> json) {
    List<BannerEntity> banners =
        json.map((i) => BannerEntity.fromJson(i)).toList();

    return new BannerEntityList(banners: banners);
  }
}
