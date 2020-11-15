import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends _Post with _$Post {
  static Post fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  static Map<String, dynamic> toJson(Post post) => _$PostToJson(post);
}

abstract class _Post with Store {
  @observable
  String user_id;

  @observable
  String id;

  @observable
  String category;

  @observable
  String description;

  @observable
  String imageUrl;

  @observable
  String created_at;

  @observable
  String latitude;

  @observable
  String longitude;

  @observable
  bool identity;
}
