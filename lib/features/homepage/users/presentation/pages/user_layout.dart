import 'package:flutter/material.dart';

import '../widgets/user_widget.dart';

class UserLayout extends StatelessWidget {
  const UserLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserWidget(),
      ],
    );
  }
}
