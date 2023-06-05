// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../homepage/users/data/models/user.dart';
import '../widgets/user_detail_widget.dart';

// ignore: must_be_immutable
class UserDetailLayout extends StatelessWidget {
  User user;
  UserDetailLayout({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserDetailWidget(
          user: user,
        ),
      ],
    );
  }
}
