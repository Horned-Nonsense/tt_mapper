import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

class LatLngSerializer implements JsonConverter<LatLng, GeoPoint> {
  const LatLngSerializer();

  @override
  LatLng fromJson(GeoPoint json) => LatLng(json.latitude, json.longitude);

  @override
  GeoPoint toJson(LatLng object) => GeoPoint(object.latitude, object.longitude);
}
