import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_bloc/core/extensions/string_extensions.dart';

class LocaleText extends StatelessWidget {
  final String text;
  const LocaleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text.locale);
  }
}
