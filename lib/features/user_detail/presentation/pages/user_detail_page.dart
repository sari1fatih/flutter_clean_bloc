// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_clean_bloc/core/extensions/string_extensions.dart';

import '../../../../core/init/locale_keys.g.dart';
import '../../../../core/view/widget/custom_app_bar.dart';
import '../../../homepage/users/data/models/user.dart';
import 'user_detail_layout.dart';

// ignore: must_be_immutable
class UserDetailPage extends StatelessWidget {
  User user;
  UserDetailPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          text: LocaleKeys.userDetailPage_navigationText.locale,
        ),
        body: UserDetailLayout(
          user: user,
        ));
  }
}
