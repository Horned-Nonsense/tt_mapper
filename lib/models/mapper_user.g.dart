// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapper_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapperUser _$MapperUserFromJson(Map<String, dynamic> json) => MapperUser(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      emailAddress: json['emailAddress'] as String,
      id: json['id'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      location: _$JsonConverterFromJson<GeoPoint, LatLng>(
          json['location'], const LatLngSerializer().fromJson),
    );

Map<String, dynamic> _$MapperUserToJson(MapperUser instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'emailAddress': instance.emailAddress,
      'id': instance.id,
      'avatarUrl': instance.avatarUrl,
      'location': _$JsonConverterToJson<GeoPoint, LatLng>(
          instance.location, const LatLngSerializer().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
