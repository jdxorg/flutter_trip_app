import 'package:json_annotation/json_annotation.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'BannerEntity.g.dart';
///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class BannerEntity {
  String name;
  String image;

  BannerEntity({this.name, this.image});

  factory BannerEntity.fromJson(Map<String, dynamic> json) => _$BannerEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BannerEntityToJson(this);
}
