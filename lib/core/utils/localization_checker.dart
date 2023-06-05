import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/localization_constant.dart';

class LocalizationChecker {
  static changeLanguge(BuildContext context, Locale locale) {
    if (locale == LocalicationConstant.trLocale) {
      context.setLocale(LocalicationConstant.trLocale);
      //EasyLocalization.of(context)!.setLocale(Localication.trLocale);
    } else {
      context.setLocale(LocalicationConstant.enLocale);
      //EasyLocalization.of(context)!.setLocale(Localication.enLocale);
    }
  }
}
