import '../../models/mapper_user.dart';

abstract class UserService {
  Stream<List<MapperUser>> getUsersAround();
}
