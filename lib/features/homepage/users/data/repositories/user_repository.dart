import 'package:dartz/dartz.dart';

import '../../../../../core/init/injection_container.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasource/user_remote_datasource.dart';
import '../models/user.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl();

  @override
  Future<Either<String, User>> getUserById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<User>>> getUsers(int itemList) async {
    return serviceLocator<UserRemoteDatasource>().getUsers(itemList);
  }
}
