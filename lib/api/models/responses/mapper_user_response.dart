import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../models/mapper_user.dart';
import '../../../utils/serializers/lat_lng_serializer.dart';

part 'mapper_user_response.g.dart';

@LatLngSerializer()
@JsonSerializable()
class MapperUserResponse extends Equatable {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String? id;
  final String? avatarUrl;
  final LatLng? location;

  const MapperUserResponse({
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    this.id,
    this.avatarUrl,
    this.location,
  });

  factory MapperUserResponse.fromJson(Map<String, dynamic> json) =>
      _$MapperUserResponseFromJson(json);

  Future<MapperUser> toMapperUser() async {

    return MapperUser(
      firstName: firstName,
      lastName: lastName,
      emailAddress: emailAddress,
      id: id ?? '',
      avatarUrl: avatarUrl,
      location: location,
    );
  }

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
