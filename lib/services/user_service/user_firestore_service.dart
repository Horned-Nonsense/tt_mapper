import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../api/models/responses/mapper_user_response.dart';
import '../../utils/mixins/firebase_instance_mixins.dart';
import '../../utils/mixins/firebase_path_mixin.dart';
import 'user_service.dart';
import '../../utils/firebase_utils.dart';
import '../../models/mapper_user.dart';

Future<MapperUser> snapshotToUser(
  DocumentSnapshot<Map<String, dynamic>> value,
) async {
  return MapperUserResponse.fromJson(value.getMapped()).toMapperUser();
}

@named
@Injectable(as: UserService)
class UserFirestoreService extends UserService
    with FirebaseInstanceMixin, FirebasePathMixin {}
