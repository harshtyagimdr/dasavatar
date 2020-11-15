// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post()
    ..user_id = json['user_id'] as String
    ..id = json['id'] as String
    ..category = json['category'] as String
    ..description = json['description'] as String
    ..imageUrl = json['imageUrl'] as String
    ..created_at = json['created_at'] as String
    ..latitude = json['latitude'] as String
    ..longitude = json['longitude'] as String
    ..addressString = json['addressString'] as String
    ..identity = json['identity'] as bool;
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'created_at': instance.created_at,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'addressString': instance.addressString,
      'identity': instance.identity,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Post on _Post, Store {
  final _$user_idAtom = Atom(name: '_Post.user_id');

  @override
  String get user_id {
    _$user_idAtom.context.enforceReadPolicy(_$user_idAtom);
    _$user_idAtom.reportObserved();
    return super.user_id;
  }

  @override
  set user_id(String value) {
    _$user_idAtom.context.conditionallyRunInAction(() {
      super.user_id = value;
      _$user_idAtom.reportChanged();
    }, _$user_idAtom, name: '${_$user_idAtom.name}_set');
  }

  final _$idAtom = Atom(name: '_Post.id');

  @override
  String get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$categoryAtom = Atom(name: '_Post.category');

  @override
  String get category {
    _$categoryAtom.context.enforceReadPolicy(_$categoryAtom);
    _$categoryAtom.reportObserved();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.context.conditionallyRunInAction(() {
      super.category = value;
      _$categoryAtom.reportChanged();
    }, _$categoryAtom, name: '${_$categoryAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_Post.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$imageUrlAtom = Atom(name: '_Post.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.context.enforceReadPolicy(_$imageUrlAtom);
    _$imageUrlAtom.reportObserved();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.context.conditionallyRunInAction(() {
      super.imageUrl = value;
      _$imageUrlAtom.reportChanged();
    }, _$imageUrlAtom, name: '${_$imageUrlAtom.name}_set');
  }

  final _$created_atAtom = Atom(name: '_Post.created_at');

  @override
  String get created_at {
    _$created_atAtom.context.enforceReadPolicy(_$created_atAtom);
    _$created_atAtom.reportObserved();
    return super.created_at;
  }

  @override
  set created_at(String value) {
    _$created_atAtom.context.conditionallyRunInAction(() {
      super.created_at = value;
      _$created_atAtom.reportChanged();
    }, _$created_atAtom, name: '${_$created_atAtom.name}_set');
  }

  final _$latitudeAtom = Atom(name: '_Post.latitude');

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

  final _$longitudeAtom = Atom(name: '_Post.longitude');

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

  final _$addressStringAtom = Atom(name: '_Post.addressString');

  @override
  String get addressString {
    _$addressStringAtom.context.enforceReadPolicy(_$addressStringAtom);
    _$addressStringAtom.reportObserved();
    return super.addressString;
  }

  @override
  set addressString(String value) {
    _$addressStringAtom.context.conditionallyRunInAction(() {
      super.addressString = value;
      _$addressStringAtom.reportChanged();
    }, _$addressStringAtom, name: '${_$addressStringAtom.name}_set');
  }

  final _$identityAtom = Atom(name: '_Post.identity');

  @override
  bool get identity {
    _$identityAtom.context.enforceReadPolicy(_$identityAtom);
    _$identityAtom.reportObserved();
    return super.identity;
  }

  @override
  set identity(bool value) {
    _$identityAtom.context.conditionallyRunInAction(() {
      super.identity = value;
      _$identityAtom.reportChanged();
    }, _$identityAtom, name: '${_$identityAtom.name}_set');
  }
}
