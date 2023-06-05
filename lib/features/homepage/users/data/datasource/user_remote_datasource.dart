import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../../core/constants/url_info_constant.dart';
import '../../../../../core/init/injection_container.dart';
import '../../../../../core/request.dart';
import '../models/user.dart';

abstract class UserRemoteDatasource {
  Future<Either<String, List<User>>> getUsers(int itemList);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final Request request = serviceLocator<Request>();

  @override
  Future<Either<String, List<User>>> getUsers(int itemList) async {
    try {
      final res = await request
          .get('users?limit=${UrlInfoConstant.limit}&skip=${(itemList)}', {});

      if (res.statusCode == 200) {
        final jsonBody = json.decode(res.body);
        List<User> listUser = [];
        final userListMap = jsonBody['users'];

        for (var user in userListMap) {
          listUser.add(User.fromMap(user));
        }

        return Right(listUser);
      }
      return const Left("Hata mevcut");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
