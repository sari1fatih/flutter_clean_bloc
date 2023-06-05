import 'package:dartz/dartz.dart';

import '../../../../../core/init/injection_container.dart';
import '../../data/models/user.dart';
import '../repositories/user_repository.dart';

class GetUsersUsecase {
  Future<Either<String, List<User>>> call(int itemList) async {
    return await serviceLocator<UserRepository>().getUsers(itemList);
  }
}
