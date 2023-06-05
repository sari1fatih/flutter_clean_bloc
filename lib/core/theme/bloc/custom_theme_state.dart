import 'package:equatable/equatable.dart';

import '../custom_theme.dart';

class CustomThemeState extends Equatable {
  final AppThemeStatus appThemeStatus;
  const CustomThemeState({
    appThemeStatus,
  }) : appThemeStatus = appThemeStatus ?? AppThemeStatus.light;

  @override
  List<Object> get props => [appThemeStatus];

  CustomThemeState copyWith({
    AppThemeStatus? appThemeStatus,
  }) {
    return CustomThemeState(
      appThemeStatus: appThemeStatus ?? this.appThemeStatus,
    );
  }
}
