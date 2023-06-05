import 'package:get_it/get_it.dart';

import '../../features/homepage/users/data/datasource/user_remote_datasource.dart';
import '../../features/homepage/users/data/repositories/user_repository.dart';
import '../../features/homepage/users/domain/repositories/user_repository.dart';
import '../../features/homepage/users/domain/usecases/get_user_detail_usecase.dart';
import '../../features/homepage/users/domain/usecases/get_users_usecase.dart';
import '../request.dart';

final serviceLocator = GetIt.instance;
Future<void> setUpServiceLocator() async {
  serviceLocator.registerLazySingleton<UserRepository>(
    () => const UserRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<GetUsersUsecase>(
    () => GetUsersUsecase(),
  );
  serviceLocator.registerFactory<GetUserDetailUsecase>(
    () => GetUserDetailUsecase(),
  );

  serviceLocator.registerFactory<UserRemoteDatasource>(
    () => UserRemoteDatasourceImpl(),
  );

  serviceLocator.registerSingleton<Request>(Request());
}
