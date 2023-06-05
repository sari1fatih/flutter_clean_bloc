import 'package:flutter/material.dart';

enum AppThemeStatus { light, dark }

extension AppThemeStatusX on AppThemeStatus {
  bool get isLight => this == AppThemeStatus.light;
  bool get isDark => this == AppThemeStatus.dark;
}

final appThemeData = {
  AppThemeStatus.dark: ThemeData.dark(),
  AppThemeStatus.light: ThemeData.light()
};
