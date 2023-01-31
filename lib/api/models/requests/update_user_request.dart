import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../utils/serializers/lat_lng_serializer.dart';

part 'update_user_request.g.dart';

@LatLngSerializer()
@JsonSerializable()
class UpdateUserRequest extends Equatable {
  final LatLng? location;

  const UpdateUserRequest({
    this.location,
  });

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);

  @override
  List<Object?> get props => [
        location,
      ];
}
