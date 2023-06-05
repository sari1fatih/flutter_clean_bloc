// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/image_path_constant.dart';
import '../../constants/localization_constant.dart';
import '../../utils/localization_checker.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String text;
  CustomAppBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      actions: [
        SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  LocalizationChecker.changeLanguge(
                      context, LocalicationConstant.trLocale);
                },
                child: Opacity(
                  opacity: EasyLocalization.of(context)!.currentLocale ==
                          LocalicationConstant.trLocale
                      ? 1
                      : 0.5,
                  child: Image.asset(
                    ImagePathConstant.turkiyeFlag,
                    width: 33,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  LocalizationChecker.changeLanguge(
                      context, LocalicationConstant.enLocale);
                },
                child: Opacity(
                  opacity: EasyLocalization.of(context)!.currentLocale ==
                          LocalicationConstant.enLocale
                      ? 1
                      : 0.5,
                  child: Image.asset(
                    ImagePathConstant.englandFlag,
                    width: 33,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
