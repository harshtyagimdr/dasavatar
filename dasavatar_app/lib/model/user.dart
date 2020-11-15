import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends _User with _$User {
  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static Map<String, dynamic> toJson(User user) => _$UserToJson(user);
}

abstract class _User with Store {
  @observable
  String uid;

  @observable
  String name;

  @observable
  String dob;

  @observable
  String phoneNumber;

  @observable
  String imgUrl;

  @observable
  String email;

  @observable
  String createdAt;

  @observable
  String latitude;

  @observable
  String longitude;

  @observable
  String deviceToken;
}
