// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../homepage/users/data/models/user.dart';

// ignore: must_be_immutable
class UserDetailSuccessWidget extends StatelessWidget {
  User user;
  UserDetailSuccessWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Image.network(
              user.image,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: ListTile(
              title: Center(
                child: Text(
                  "${user.firstName} ${user.lastName}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              subtitle: Center(child: Text(user.phone)),
            ),
          ),
        ],
      ),
    );
  }
}
