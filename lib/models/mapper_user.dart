import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/serializers/lat_lng_serializer.dart';

part 'mapper_user.g.dart';

@LatLngSerializer()
@JsonSerializable()
class MapperUser extends Equatable {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String id;
  final String? avatarUrl;
  final LatLng? location;

  const MapperUser({
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.id,
    this.avatarUrl,
    this.location,
  });

  String get fullName => '$firstName $lastName';

  MapperUser copyWith({
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? id,
    String? avatarUrl,
    LatLng? location,
  }) {
    return MapperUser(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailAddress: emailAddress ?? this.emailAddress,
      id: id ?? this.id,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      location: location ?? this.location,
    );
  }

  const MapperUser.empty()
      : firstName = '',
        lastName = '',
        emailAddress = '',
        id = '',
        avatarUrl = null,
        location = null;

  factory MapperUser.fromJson(Map<String, dynamic> json) =>
      _$MapperUserFromJson(json);

  Map<String, dynamic> toJson() => _$MapperUserToJson(this);

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        emailAddress,
        id,
        avatarUrl,
        location,
      ];
}
