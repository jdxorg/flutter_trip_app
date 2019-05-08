import 'package:json_annotation/json_annotation.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'NavbarEntity.g.dart';
///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class NavbarEntity {
  String name;
  String image;

  NavbarEntity({this.name, this.image});

  factory NavbarEntity.fromJson(Map<String, dynamic> json) => _$NavbarEntityFromJson(json);
  Map<String, dynamic> toJson() => _$NavbarEntityToJson(this);
}