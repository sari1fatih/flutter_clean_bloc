import 'package:flutter/material.dart';
import '../../features/homepage/users/data/models/user.dart';
import '../../features/homepage/users/presentation/pages/user_page.dart';
import '../../features/user_detail/presentation/pages/user_detail_page.dart';
import 'route_const.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteConst.homeRoute:
        return MaterialPageRoute(builder: (_) => const UserPage());
      case RouteConst.userDetailRoute:
        if (args is User) {
          return MaterialPageRoute(
            builder: (_) => UserDetailPage(
              user: args,
            ),
          );
        }

        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
