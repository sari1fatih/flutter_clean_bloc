import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/users_bloc.dart';
import 'error_chicked_widget.dart';
import 'user_success_widget.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? UserSuccessWidget(usersState: state)
            : state.status.isInitial
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : state.status.isError
                    ? const ErrorChickeWidget()
                    : const SizedBox();
      },
    );
  }
}
