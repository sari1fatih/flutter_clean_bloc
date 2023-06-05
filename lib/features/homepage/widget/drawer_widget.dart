import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_bloc/core/extensions/string_extensions.dart';

import '../../../core/constants/localization_constant.dart';
import '../../../core/init/locale_keys.g.dart';
import '../../../core/theme/bloc/custom_theme_bloc.dart';
import '../../../core/theme/bloc/custom_theme_event.dart';
import '../../../core/theme/bloc/custom_theme_state.dart';
import '../../../core/theme/custom_theme.dart';
import '../../../core/utils/localization_checker.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<bool> _selectedLanguage = <bool>[
      EasyLocalization.of(context)!.currentLocale ==
          LocalicationConstant.trLocale,
      EasyLocalization.of(context)!.currentLocale ==
          LocalicationConstant.enLocale
    ];
    return BlocBuilder<CustomThemeBloc, CustomThemeState>(
      builder: (context, state) {
        return Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://robohash.org/hicveldicta.png'),
                ),
                accountName: Text("Fatih SARI"),
                accountEmail: Text("fatihsari1992@gmail.com"),
              ),
              SwitchListTile(
                title: Text(LocaleKeys.drawer_theme.locale),
                value: state.appThemeStatus == AppThemeStatus.dark,
                onChanged: (bool value) {
                  context.read<CustomThemeBloc>().add(ChangeThemeEvent(
                      appThemeStatus:
                          value ? AppThemeStatus.dark : AppThemeStatus.light));
                },
              ),
              const Divider(color: Colors.black54),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: Text(LocaleKeys.drawer_home.locale),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.favorite_border),
                title: Text(LocaleKeys.drawer_favorite.locale),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.workspaces_outline),
                title: Text(LocaleKeys.drawer_workflow.locale),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.update),
                title: Text(LocaleKeys.drawer_updates.locale),
                onTap: () {},
              ),
              const Divider(color: Colors.black54),
              ListTile(
                leading: Text(LocaleKeys.drawer_appLanguage_text.locale),
                title: Align(
                  alignment: Alignment.centerRight,
                  child: ToggleButtons(
                    direction: Axis.horizontal,
                    onPressed: (int index) {
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < _selectedLanguage.length; i++) {
                          _selectedLanguage[i] = i == index;
                        }
                      });
                      LocalizationChecker.changeLanguge(
                          context, LocalicationConstant.supportedLocale[index]);
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    constraints: const BoxConstraints(
                      minHeight: 25.0,
                      minWidth: 55.0,
                    ),
                    isSelected: _selectedLanguage,
                    children: [
                      Text(LocaleKeys.drawer_appLanguage_languages_tr.locale),
                      Text(LocaleKeys.drawer_appLanguage_languages_en.locale),
                    ],
                  ),
                ),
                onTap: () {},
              ),
              const Divider(color: Colors.black54),
            ],
          ),
        );
      },
    );
  }
}
