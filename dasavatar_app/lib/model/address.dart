import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends _Address with _$Address {
  static Address fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  static Map<String, dynamic> toJson(Address address) =>
      _$AddressToJson(address);
}

abstract class _Address with Store {
  @observable
  @JsonKey(name: 'subThoroughfare')
  String address1;

  @observable
  @JsonKey(name: 'thoroughfare')
  String address2;

  @observable
  @JsonKey(name: 'subLocality')
  String region;

  @observable
  @JsonKey(name: 'locality')
  String city;

  @observable
  @JsonKey(name: 'subAdministrativeArea')
  String district;

  @observable
  @JsonKey(name: 'administrativeArea')
  String state;

  @observable
  String postalCode;

  @observable
  String country;

  @observable
  String latitude;

  @observable
  String longitude;

  @computed
  String get addressString {
    String add = '';
    add += address1 != null && address1.isNotEmpty ? address1 + ', ' : '';
    add += address2 != null && address2.isNotEmpty ? address2 + ', ' : '';
    add += region != null && region.isNotEmpty ? region + ', ' : '';
    add += city != null && city.isNotEmpty ? city + ', ' : '';
    add += district != null && district.isNotEmpty ? district + ', ' : '';
    add += state != null && state.isNotEmpty ? state + ', ' : '';
    add += postalCode != null && postalCode.isNotEmpty ? postalCode + ', ' : '';
    add += country != null && country.isNotEmpty ? country : '';
    return add;
  }
}