// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../homepage/users/data/models/user.dart';
import 'user_detail_success_widget.dart';

// ignore: must_be_immutable
class UserDetailWidget extends StatelessWidget {
  User user;
  UserDetailWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserDetailSuccessWidget(
      user: user,
    );
  }
}
