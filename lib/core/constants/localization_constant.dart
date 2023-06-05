import 'package:flutter/material.dart';

class LocalicationConstant {
  static const supportedLocale = [
    LocalicationConstant.trLocale,
    LocalicationConstant.enLocale
  ];

  static const enLocale = Locale("en", "US");
  static const trLocale = Locale("tr", "TR");
  static const langPath = "assets/translations";
}
