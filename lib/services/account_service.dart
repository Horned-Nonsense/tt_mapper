import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> updateUserData(MapperUser user) async {
    await makeErrorHandledCall(() async {
      await _authService.users.doc(_authService.currentUser?.uid).update(
            UpdateUserRequest(
              location: user.location,
            ).toJson(),
          );
    });
  }
}
