import 'package:flutter/material.dart';
import 'package:flutter_clean_bloc/core/extensions/string_extensions.dart';

import '../../../../../core/init/locale_keys.g.dart';
import '../../../../../core/view/widget/custom_app_bar.dart';
import '../../../widget/drawer_widget.dart';
import 'user_layout.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.userPage_navigationText.locale,
      ),
      drawer: const DrawerWidget(),
      body: const UserLayout(),
    );
  }
}
