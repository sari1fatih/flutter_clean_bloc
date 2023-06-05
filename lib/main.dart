import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/localization_constant.dart';
import 'core/init/injection_container.dart';
import 'core/router/route_const.dart';
import 'core/router/route_generator.dart';
import 'core/theme/bloc/custom_theme_bloc.dart';
import 'core/theme/bloc/custom_theme_state.dart';
import 'core/theme/custom_theme.dart';
import 'core/utils/bloc_provider_list.dart';
import 'features/homepage/users/presentation/pages/user_page.dart';

Future<void> main() async {
  await setUpServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: LocalicationConstant.supportedLocale,
      path: LocalicationConstant.langPath,
      fallbackLocale: LocalicationConstant.enLocale,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) {},
      child: MultiBlocProvider(
        providers: BlocProviderList.getBlocProviderList(),
        child: BlocBuilder<CustomThemeBloc, CustomThemeState>(
          builder: _buildWithTheme,
        ),
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, CustomThemeState state) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Info Games',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RouteConst.homeRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: Text('Birşeyler ters gitti'),
                ),
              )),
      debugShowCheckedModeBanner: false,
      theme: appThemeData[state.appThemeStatus],
      // ignore: prefer_const_constructors
      home: UserPage(),
    );
  }
}
