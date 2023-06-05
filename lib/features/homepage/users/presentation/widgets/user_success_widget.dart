// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/users_bloc.dart';
import 'user_item_widget.dart';

class UserSuccessWidget extends StatefulWidget {
  const UserSuccessWidget({
    Key? key,
    required this.usersState,
  }) : super(key: key);
  final UsersState usersState;

  @override
  State<UserSuccessWidget> createState() => _UserSuccessWidgetState();
}

class _UserSuccessWidgetState extends State<UserSuccessWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<UsersBloc>().add(GetUsersEvent());
    }
  }

  bool get _isBottom {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.offset) {
      return true;
    }
    return false;
  }

  Future<void> refresh() async {
    context.read<UsersBloc>().add(GetUsersRefreshEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            itemCount: widget.usersState.listUser.length + 1,
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index < widget.usersState.listUser.length) {
                return UserItemWidget(user: widget.usersState.listUser[index]);
              } else if (widget.usersState.hasReachedMax) {
                return const Center(
                    child: Text(
                  "Hepsi Bu Kadar",
                  style: TextStyle(fontSize: 15),
                ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
