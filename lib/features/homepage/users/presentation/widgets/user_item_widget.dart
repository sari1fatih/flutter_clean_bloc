// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../../../core/router/route_const.dart';
import '../../data/models/user.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.image),
      ),
      title: Text(
        "${user.id} ${user.firstName} ${user.lastName}",
        style: const TextStyle(fontSize: 20),
      ),
      onTap: () => {
        Navigator.pushNamed(context, RouteConst.userDetailRoute,
            arguments: user)
      },
      subtitle: Text(user.phone),
    );
  }
}
