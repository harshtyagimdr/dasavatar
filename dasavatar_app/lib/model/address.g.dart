// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address()
    ..address1 = json['subThoroughfare'] as String
    ..address2 = json['thoroughfare'] as String
    ..region = json['subLocality'] as String
    ..city = json['locality'] as String
    ..district = json['subAdministrativeArea'] as String
    ..state = json['administrativeArea'] as String
    ..postalCode = json['postalCode'] as String
    ..country = json['country'] as String
    ..latitude = json['latitude'] as String
    ..longitude = json['longitude'] as String;
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'subThoroughfare': instance.address1,
      'thoroughfare': instance.address2,
      'subLocality': instance.region,
      'locality': instance.city,
      'subAdministrativeArea': instance.district,
      'administrativeArea': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Address on _Address, Store {
  Computed<String> _$addressStringComputed;

  @override
  String get addressString =>
      (_$addressStringComputed ??= Computed<String>(() => super.addressString))
          .value;

  final _$address1Atom = Atom(name: '_Address.address1');

  @override
  String get address1 {
    _$address1Atom.context.enforceReadPolicy(_$address1Atom);
    _$address1Atom.reportObserved();
    return super.address1;
  }

  @override
  set address1(String value) {
    _$address1Atom.context.conditionallyRunInAction(() {
      super.address1 = value;
      _$address1Atom.reportChanged();
    }, _$address1Atom, name: '${_$address1Atom.name}_set');
  }

  final _$address2Atom = Atom(name: '_Address.address2');

  @override
  String get address2 {
    _$address2Atom.context.enforceReadPolicy(_$address2Atom);
    _$address2Atom.reportObserved();
    return super.address2;
  }

  @override
  set address2(String value) {
    _$address2Atom.context.conditionallyRunInAction(() {
      super.address2 = value;
      _$address2Atom.reportChanged();
    }, _$address2Atom, name: '${_$address2Atom.name}_set');
  }

  final _$regionAtom = Atom(name: '_Address.region');

  @override
  String get region {
    _$regionAtom.context.enforceReadPolicy(_$regionAtom);
    _$regionAtom.reportObserved();
    return super.region;
  }

  @override
  set region(String value) {
    _$regionAtom.context.conditionallyRunInAction(() {
      super.region = value;
      _$regionAtom.reportChanged();
    }, _$regionAtom, name: '${_$regionAtom.name}_set');
  }

  final _$cityAtom = Atom(name: '_Address.city');

  @override
  String get city {
    _$cityAtom.context.enforceReadPolicy(_$cityAtom);
    _$cityAtom.reportObserved();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.context.conditionallyRunInAction(() {
      super.city = value;
      _$cityAtom.reportChanged();
    }, _$cityAtom, name: '${_$cityAtom.name}_set');
  }

  final _$districtAtom = Atom(name: '_Address.district');

  @override
  String get district {
    _$districtAtom.context.enforceReadPolicy(_$districtAtom);
    _$districtAtom.reportObserved();
    return super.district;
  }

  @override
  set district(String value) {
    _$districtAtom.context.conditionallyRunInAction(() {
      super.district = value;
      _$districtAtom.reportChanged();
    }, _$districtAtom, name: '${_$districtAtom.name}_set');
  }

  final _$stateAtom = Atom(name: '_Address.state');

  @override
  String get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$postalCodeAtom = Atom(name: '_Address.postalCode');

  @override
  String get postalCode {
    _$postalCodeAtom.context.enforceReadPolicy(_$postalCodeAtom);
    _$postalCodeAtom.reportObserved();
    return super.postalCode;
  }

  @override
  set postalCode(String value) {
    _$postalCodeAtom.context.conditionallyRunInAction(() {
      super.postalCode = value;
      _$postalCodeAtom.reportChanged();
    }, _$postalCodeAtom, name: '${_$postalCodeAtom.name}_set');
  }

  final _$countryAtom = Atom(name: '_Address.country');

  @override
  String get country {
    _$countryAtom.context.enforceReadPolicy(_$countryAtom);
    _$countryAtom.reportObserved();
    return super.country;
  }

  @override
  set country(String value) {
    _$countryAtom.context.conditionallyRunInAction(() {
      super.country = value;
      _$countryAtom.reportChanged();
    }, _$countryAtom, name: '${_$countryAtom.name}_set');
  }

  final _$latitudeAtom = Atom(name: '_Address.latitude');

  @override
  String get latitude {
    _$latitudeAtom.context.enforceReadPolicy(_$latitudeAtom);
    _$latitudeAtom.reportObserved();
    return super.latitude;
  }

  @override
  set latitude(String value) {
    _$latitudeAtom.context.conditionallyRunInAction(() {
      super.latitude = value;
      _$latitudeAtom.reportChanged();
    }, _$latitudeAtom, name: '${_$latitudeAtom.name}_set');
  }

  final _$longitudeAtom = Atom(name: '_Address.longitude');

  @override
  String get longitude {
    _$longitudeAtom.context.enforceReadPolicy(_$longitudeAtom);
    _$longitudeAtom.reportObserved();
    return super.longitude;
  }

  @override
  set longitude(String value) {
    _$longitudeAtom.context.conditionallyRunInAction(() {
      super.longitude = value;
      _$longitudeAtom.reportChanged();
    }, _$longitudeAtom, name: '${_$longitudeAtom.name}_set');
  }
}
