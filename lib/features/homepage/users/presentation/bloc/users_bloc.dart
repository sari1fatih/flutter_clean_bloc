import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/init/injection_container.dart';
import '../../../../../core/constants/url_info_constant.dart';
import '../../data/models/user.dart';
import '../../domain/usecases/get_users_usecase.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersState()) {
    on<GetUsersEvent>(_mapGetUsersEventToState);
    on<GetUsersRefreshEvent>(_mapGetUsersRefreshEvenToState);
  }

  Future<void> _mapGetUsersEventToState(
      GetUsersEvent event, Emitter<UsersState> emit) async {
    if (state.hasReachedMax) return;

    if (state.status == UsersStatus.initial)
      // ignore: curly_braces_in_flow_control_structures
      emit(state.copyWith(status: UsersStatus.initial, hasReachedMax: false));

    try {
      final getUserList =
          await serviceLocator<GetUsersUsecase>().call(state.listUser.length);
      getUserList.fold(
          (l) => emit(
                state.copyWith(status: UsersStatus.error),
              ), (r) {
        emit(
          state.copyWith(
              listUser: [...state.listUser.toList(), ...r.toList()],
              status: UsersStatus.success,
              hasReachedMax: r.toList().length != UrlInfoConstant.limit),
        );
      });
    } catch (error) {
      emit(state.copyWith(status: UsersStatus.error));
    }
  }

  Future<void> _mapGetUsersRefreshEvenToState(
      GetUsersRefreshEvent event, Emitter<UsersState> emit) async {
    try {
      final getUserList = await serviceLocator<GetUsersUsecase>().call(0);
      getUserList.fold(
          (l) => emit(
                state.copyWith(status: UsersStatus.error, hasReachedMax: false),
              ), (r) {
        emit(
          state.copyWith(
              listUser: r.toList(),
              status: UsersStatus.success,
              hasReachedMax: false),
        );
      });
    } catch (error) {
      emit(state.copyWith(status: UsersStatus.error));
    }
  }
}
