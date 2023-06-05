import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';

import '../../features/homepage/users/presentation/bloc/users_bloc.dart';
import '../theme/bloc/custom_theme_bloc.dart';

class BlocProviderList {
  static final List<SingleChildWidget> blocProviderList = [
    BlocProvider<UsersBloc>(
      create: (context) => UsersBloc()..add(GetUsersEvent()),
    ),
    BlocProvider<CustomThemeBloc>(
      create: (context) => CustomThemeBloc(),
    )
  ];

  static List<SingleChildWidget> getBlocProviderList() => blocProviderList;
}
