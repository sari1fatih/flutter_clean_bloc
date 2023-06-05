import 'package:dartz/dartz.dart';

import '../../data/models/user.dart';

abstract class UserRepository {
  Future<Either<String, List<User>>> getUsers(int itemList);
  Future<Either<String, User>> getUserById(String id);
}
