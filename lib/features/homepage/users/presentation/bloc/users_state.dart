part of './users_bloc.dart';

enum UsersStatus { initial, success, error }

extension UsersStatusX on UsersStatus {
  bool get isInitial => this == UsersStatus.initial;
  bool get isSuccess => this == UsersStatus.success;
  bool get isError => this == UsersStatus.error;
}

class UsersState extends Equatable {
  final List<User> listUser;
  final UsersStatus status;
  final bool hasReachedMax;

  const UsersState({
    listUser,
    this.hasReachedMax = false,
    this.status = UsersStatus.initial,
  }) : listUser = listUser ?? const [];

  UsersState copyWith({
    List<User>? listUser,
    UsersStatus? status,
    bool? hasReachedMax,
    bool? isDarkMode,
  }) {
    return UsersState(
      listUser: listUser ?? this.listUser,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [listUser, status, hasReachedMax];
}
