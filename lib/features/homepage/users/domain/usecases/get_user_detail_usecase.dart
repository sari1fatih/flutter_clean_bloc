import 'package:dartz/dartz.dart';

import '../../../../../core/init/injection_container.dart';
import '../../data/models/user.dart';
import '../repositories/user_repository.dart';

class GetUserDetailUsecase {
  Future<Either<String, User>> call(String productId) async {
    return await serviceLocator<UserRepository>().getUserById(productId);
  }
}
