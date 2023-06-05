part of './users_bloc.dart';

class UsersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUsersEvent extends UsersEvent {}

class GetUsersRefreshEvent extends UsersEvent {}

class ChangeThemeEvent extends UsersEvent {}
