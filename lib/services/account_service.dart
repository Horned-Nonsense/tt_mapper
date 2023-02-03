import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../api/models/requests/update_user_request.dart';
import '../api/models/responses/mapper_user_response.dart';
import '../models/mapper_user.dart';
import '/services/auth_service.dart';
import '/services/base_service.dart';
import '../utils/firebase_utils.dart';

Future<MapperUser> _snapshotToUser(
  DocumentSnapshot<Map<String, dynamic>> value,
) async {
  return MapperUserResponse.fromJson(value.getMapped()).toMapperUser();
}

@singleton
class AccountService extends BaseService {
  final AuthService _authService;

  AccountService(this._authService);

  Future<MapperUser> getUsersData() async {
    final user = await _authService.users
        .doc(_authService.currentUser?.uid)
        .getMapped(_snapshotToUser);
    return await user;
  }

  Future<void> getCurrentUserLocation() async {
    await makeErrorHandledCall(() async {
      await Geolocator.requestPermission()
          .then((myLocation) {})
          .onError((error, stackTrace) async {
        await Geolocator.requestPermission();
      });
      final location = await Geolocator.getCurrentPosition();
      await _updateUserData(location);
    });
  }

  Future<void> _updateUserData(Position location) async {
    await makeErrorHandledCall(() async {
      await _authService.users.doc(_authService.currentUser?.uid).update(
            UpdateUserRequest(
              location: LatLng(location.latitude, location.longitude),
            ).toJson(),
          );
    });
  }
}
