import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_theme_event.dart';
import 'custom_theme_state.dart';

class CustomThemeBloc extends Bloc<CustomThemeEvent, CustomThemeState> {
  CustomThemeBloc() : super(const CustomThemeState()) {
    on<ChangeThemeEvent>(_mapChangeThemeEventToState);
  }

  Future<void> _mapChangeThemeEventToState(
      ChangeThemeEvent event, Emitter<CustomThemeState> emit) async {
    emit(
      state.copyWith(
        appThemeStatus: event.appThemeStatus,
      ),
    );
  }
}
