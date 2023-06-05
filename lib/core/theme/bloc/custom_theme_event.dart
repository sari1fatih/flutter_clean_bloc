// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../custom_theme.dart';

class CustomThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends CustomThemeEvent {
  final AppThemeStatus appThemeStatus;

  ChangeThemeEvent({
    required this.appThemeStatus,
  }) : super();
}
